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

  void login(String email, String password, callback) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      callback.call();
    }
  }

  void registerUser(String email, String password, Function callback) async {
    try {
      UserCredential credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String uid = credentials.user?.uid ?? "-1";
    } on FirebaseAuthException catch (e) {
      callback.call();
    }
  }

  void changePassword(String password) async
  {
    await FirebaseAuth.instance.currentUser?.updatePassword(password);
  }

}
