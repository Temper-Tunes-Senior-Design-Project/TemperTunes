import 'package:firebase_auth/firebase_auth.dart';

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

  void login(String email, String password,Function callback) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
      callback.call();
    }
  }

  Future<String> registerUser(String email, String password, String username, Function callback) async {
    try {
      UserCredential credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseAuth.instance.currentUser?.updateDisplayName(username);
      FirebaseAuth.instance.currentUser?.sendEmailVerification();
      return credentials.user?.uid ?? "Invalid Credentials";

    } on FirebaseAuthException catch (e) {
      callback.call();
      return "Invalid Credentials";
    }
  }

  void changePassword(String password) async
  {
    await FirebaseAuth.instance.currentUser?.updatePassword(password);
  }

}
