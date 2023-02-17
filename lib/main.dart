import 'package:flutter/material.dart';
//import 'package:mood_swing/Containers/LoginContainer.dart';
import 'Pages/HomePage.dart';
import 'Pages/VerificationPage.dart';
import 'Widgets/MockNavigator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

        ///    canvasColor: MaterialColor(0x651fff, color),
        fontFamily: 'Maven Pro',
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // home: LoginContainer(),
      home: HomePage(),

      ///   home: const VerificationPage(),
    );
  }
}
