import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  Stream<User?> authMonitor() {
    return FirebaseAuth.instance.authStateChanges();
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  String getUserUID() {
    return FirebaseAuth.instance.currentUser?.uid ?? "";
  }

  void login(String email, String password, Function callback, context) async {
    try {
     UserCredential cred =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      credentialSignIn(LoginCredentials(cred, EmailAuthProvider.credential(email: email, password: password)),context);
    } on FirebaseAuthException catch (e) {
      print(e);
      callback.call();
    }
  }

  void credentialSignIn(LoginCredentials credentials, BuildContext context) async {
    if (credentials.uc.additionalUserInfo?.isNewUser ?? false)
    {
      DatabaseRouter().createUser(credentials.uc.user?.displayName ?? "");
    }

    await FirebaseAuth.instance.signInWithCredential(credentials.ac);
    if(FirebaseAuth.instance.currentUser != null)
      {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (ctxt) => HomePage()), (route) => false);
      }
  }

  Future<AuthCredential?> signInWithProvider(String provider) async {
    try {
      GoogleSignInAccount? account = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? auth = await account?.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: auth?.accessToken,
        idToken: auth?.idToken,
      );
      return credential;
      await FirebaseAuth.instance.signInWithCredential(credential);

      print(FirebaseAuth.instance.currentUser?.displayName);
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
  //FirebaseAuth.instance.currentUser?.updateDisplayName(username);
  //       /

  Future<LoginCredentials?> registerUser(
      String email, String password, String username, Function callback) async {
    try {
      UserCredential credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseAuth.instance.currentUser?.sendEmailVerification();

      return LoginCredentials(credentials, EmailAuthProvider.credential(email: email, password: password));
    } on FirebaseAuthException catch (e) {
      print(e);
      callback.call();
      return null;
    }
  }

  void changePassword(String password) async {
    await FirebaseAuth.instance.currentUser?.updatePassword(password);
  }

  void changeEmail(String email) async {
    await FirebaseAuth.instance.currentUser?.updateEmail(email);
  }
}
