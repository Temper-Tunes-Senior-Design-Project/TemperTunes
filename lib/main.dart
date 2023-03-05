import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/ChangePasswordPage.dart';
import 'package:mood_swing/Pages/SignupPage.dart';
import 'package:mood_swing/Pages/VerificationPage.dart';
import 'Widgets/MockNavigator.dart';
import 'firebase_options.dart';
import 'package:mood_swing/Pages/UserPage.dart';
import 'package:mood_swing/Pages/ChangeEmailPage.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  cameras = await availableCameras();
  runApp(App());
}

class App extends StatelessWidget {
  final MockNavigator? mockNavigator; //Used to add a binding for testing

  App({this.mockNavigator});

  final Map<int, Color> color = {
    50: Color.fromRGBO(13, 0, 54, 0.1),
    100: Color.fromRGBO(13, 0, 54, 0.2),
    200: Color.fromRGBO(13, 0, 54, 0.3),
    300: Color.fromRGBO(13, 0, 54, 0.4),
    400: Color.fromRGBO(13, 0, 54, 0.5),
    500: Color.fromRGBO(13, 0, 54, 0.6),
    600: Color.fromRGBO(13, 0, 54, 0.7),
    700: Color.fromRGBO(13, 0, 54, 0.8),
    800: Color.fromRGBO(13, 0, 54, 0.9),
    900: Color.fromRGBO(13, 0, 54, 1),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Swing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xd789ff, color),
        fontFamily: 'Maven Pro',
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      //   home: LoginContainer(),
      home: ChangePasswordPage(),

      ///   home: SignupPage(),
    );
  }
}
