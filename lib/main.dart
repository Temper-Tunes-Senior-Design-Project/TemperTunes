import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/UserPage.dart';

import 'Pages/HomePage.dart';
import 'Pages/LandingPage.dart';
import 'Pages/LoginPage.dart';
import 'Pages/SignupPage.dart';
import 'Pages/PreferencesPage.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App();

  Map<int, Color> color = {
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Swing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: MaterialColor(0x0d0036, color),
          fontFamily: 'Maven Pro'),

    home: PreferencesPage(),
 //    home: SignupPage(),
    );
  }
}
