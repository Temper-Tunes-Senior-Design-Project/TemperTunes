import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mood_swing/Pages/LandingPage.dart';
import 'package:mood_swing/Pages/OnboardingPage.dart';
import 'package:mood_swing/Utilities/DatabaseRouter.dart';
import 'package:mood_swing/Objects/User.dart' as AppUser;

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

  AppUser.User getUser()
  {
    print(FirebaseAuth.instance.currentUser);
    return AppUser.User(FirebaseAuth.instance.currentUser?.displayName??"No Display Name Set");
  }

  /**
   * Checks if the current user is signed in and exists
   */
  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  void logout(BuildContext context)
  {
    FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (ctxt) => LandingPage()
        ),
            (route) => false);
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
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password);
      credentialSignIn(
          EmailAuthProvider.credential(email: email.trim(), password: password),
          context);
    } on FirebaseAuthException catch (e) {
      print(e);
      callback.call();
    }
  }

  /**
   * Initializes the Facebook Javascript SDK
   */
  void initializeFacebookSDK() async {
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: dotenv.env["FACEBOOK_APP_ID"] ?? "",
      cookie: true,
      xfbml: true,
      version: "v14.0",
    );
  }

  /**
   * Uses a set of credentials to sign the user. Create a database entry for the
   * user if they are new. Reroutes user to the home page.
   */
  void credentialSignIn(AuthCredential ac, BuildContext context) async {
    UserCredential uc = await FirebaseAuth.instance.signInWithCredential(ac);
    if (!await DatabaseRouter().userExists(uc.user?.uid??"No user")) {
      DatabaseRouter().createUser(uc.user?.displayName ?? "Invalid User");
    }

    if (FirebaseAuth.instance.currentUser != null) {
      if(uc.additionalUserInfo?.isNewUser ?? false == false) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (ctxt) =>
                  HomePage(
                    shouldOnboard: uc.additionalUserInfo?.isNewUser ?? false,
                  ),
            ),
                (route) => false);
      }
      else
        {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (ctxt) =>
                   OnboardingPage()
              ),
                  (route) => false);
        }
    }
  }

  /**
   * Generates an authentication credential using an OAuth 2.0 provider
   */
  void googleSignIn(context) async {
    try {
      GoogleSignInAccount? account = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? auth = await account?.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: auth?.accessToken,
        idToken: auth?.idToken,
      );
      credentialSignIn(credential, context);
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  /**
   * Sign in using the Facebook SDK
   */
  void facebookSignIn(context) async {
    LoginResult result = await FacebookAuth.i.login();
    if (result.status == LoginStatus.success) {
      OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      credentialSignIn(credential, context);
    } else {
      //Log an error
    }
  }

  /**
   * Creates a user using an email and password.
   */
  Future<AuthCredential?> registerUser(
      String name, String email, String password, String username, Function callback) async {
    try {
      UserCredential credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email.trim(), password: password);
      credentials.user?.updateDisplayName(name);
      FirebaseAuth.instance.currentUser?.sendEmailVerification();

      return EmailAuthProvider.credential(email: email, password: password);
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
