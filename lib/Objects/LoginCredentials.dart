import 'package:firebase_auth/firebase_auth.dart';

class LoginCredentials {
  UserCredential uc;
  AuthCredential ac;

  LoginCredentials(this.uc,this.ac);
}