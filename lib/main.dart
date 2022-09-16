import 'package:flutter/material.dart';

import 'Pages/HomePage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
