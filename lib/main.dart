import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';
import 'Pages/LandingPage.dart';
import 'Widgets/MockNavigator.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if(kDebugMode)
  {
    print("----------------------------------");
    print("RUNNING APP IN DEBUG MODE");
    print("----------------------------------");
    FirebaseAuth.instance.useAuthEmulator("localhost", 9099);
    FirebaseFirestore.instance.useFirestoreEmulator("localhost", 8080);
    FirebaseStorage.instance.useStorageEmulator("localhost", 9002);
  }

  //Catch Flutter framework errors
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  //Catch async errors
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

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
      home: StreamBuilder<User?>(
        initialData: FirebaseAuth.instance.currentUser,
        builder: (context,snapshot) {
          return snapshot.data != null?HomePage():LandingPage();
        }
      ),
    );
  }
}
