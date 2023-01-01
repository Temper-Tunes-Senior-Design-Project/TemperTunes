import 'package:flutter/material.dart';

import 'Pages/HomePage.dart';
import 'Widgets/MockNavigator.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final MockNavigator? mockNavigator; //Used to add a binding for testing

  App({this.mockNavigator});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Swing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      navigatorObservers: mockNavigator != null ? [mockNavigator!] : [],
    );
  }
}
