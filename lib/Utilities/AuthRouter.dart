import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mood_swing/Objects/LoginCredentials.dart';
import 'package:mood_swing/Utilities/DatabaseRouter.dart';

import '../Pages/HomePage.dart';

enum AuthProviders {
  Google,
  Facebook,
  Apple,
  Email,
}

class AuthRouter {
  /**
   * Returns a stream that listens to authentication state changes
   */
  Stream<User?> authMonitor() {
    return FirebaseAuth.instance.authStateChanges();
  }

  /**
   * Checks if the current user is signed in and exists
   */
  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  /**
   * Returns the users UID
   */
  String getUserUID() {
    return FirebaseAuth.instance.currentUser?.uid ?? "";
  }

  /**
   *Generates login credentials using email and password. If an error occurs the
   *callback function is invoked.
   */
  void login(String email, String password, Function callback, context) async {
    try {
      UserCredential cred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      credentialSignIn(
          LoginCredentials(cred,
              EmailAuthProvider.credential(email: email, password: password)),
          context);
    } on FirebaseAuthException catch (e) {
      print(e);
      callback.call();
    }
  }

  /**
   * Initializes the Facebook Javascript SDK
   */
  void initializeFacebookSDK() async
  {
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: dotenv.env["FACEBOOK_APP_ID"]??"",
      cookie: true,
      xfbml: true,
      version: "v14.0",
    );
  }

  /**
   * Uses a set of credentials to sign the user. Create a database entry for the
   * user if they are new. Reroutes user to the home page.
   */
  void credentialSignIn(
      LoginCredentials credentials, BuildContext context) async {
    if (credentials.uc.additionalUserInfo?.isNewUser ?? false) {
      DatabaseRouter().createUser(credentials.uc.user?.displayName ?? "");
    }

    await FirebaseAuth.instance.signInWithCredential(credentials.ac);
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (ctxt) => HomePage(
              shouldOnboard:
                  credentials.uc.additionalUserInfo?.isNewUser ?? false,
            ),
          ),
          (route) => false);
    }
  }

  /**
   * Generates an authentication credential using an OAuth 2.0 provider
   */
  Future<AuthCredential?> signInWithProvider(String provider) async {
    try {
      GoogleSignInAccount? account = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? auth = await account?.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: auth?.accessToken,
        idToken: auth?.idToken,
      );
      return credential;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  /**
   * Creates a user using an email and password.
   */
  Future<LoginCredentials?> registerUser(
      String email, String password, String username, Function callback) async {
    try {
      UserCredential credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseAuth.instance.currentUser?.sendEmailVerification();

      return LoginCredentials(credentials,
          EmailAuthProvider.credential(email: email, password: password));
    } on FirebaseAuthException catch (e) {
      print(e);
      callback.call();
      return null;
    }
  }

  /**
   * Changes the user's password
   */
  void changePassword(String password) async {
    await FirebaseAuth.instance.currentUser?.updatePassword(password);
  }

  /**
   * Changes the user's email.
   */
  void changeEmail(String email) async {
    await FirebaseAuth.instance.currentUser?.updateEmail(email);
  }
}
