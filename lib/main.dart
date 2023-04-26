import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_bluetooth/flutter_web_bluetooth.dart';
import 'package:mood_swing/Pages/LandingPage.dart';
import 'package:mood_swing/Pages/HomePage.dart';
import 'dart:ui';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mood_swing/Utilities/AuthRouter.dart';
import 'package:mood_swing/Utilities/BluetoothRouter.dart';
import 'package:mood_swing/Utilities/WebBluetoothRouter.dart';
import 'Widgets/MockNavigator.dart';
import 'firebase_options.dart';

import 'package:mood_swing/Pages/VerificationPage.dart';
import 'package:mood_swing/Pages/ExistingPlaylistsPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //Load the dotenv plugin
  await dotenv.load(fileName: ".env");
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
  

  WebBluetoothRouter wbr = new WebBluetoothRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Swing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xd789ff, color),
        fontFamily: 'Maven Pro',
      ),
      home:
      Scaffold(
        body: Center(
          child: Row(
            children: [
              Container(
                height: 200,
                width: 200,
                color: Colors.red,
                child: TextButton(
                  child: Text("Scan for Devices"),
                  onPressed: () async
                  {
                   WebBluetoothRouter().getWebDevices();
                  },
                ),
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.blue,
                child: TextButton(
                  child: Text("Write"),
                  onPressed: ()
                  {
                    WebBluetoothRouter().writeToDevice();
                  },
                ),
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.green,
                child: TextButton(
                  child: Text("Read"),
                  onPressed: ()
                  {
                    WebBluetoothRouter().readFromDevice();
                  },
                ),
              ),
            ],
          ),
        ),
      )
      // StreamBuilder<User?>(
      //     initialData: FirebaseAuth.instance.currentUser,
      //     stream: AuthRouter().authMonitor(),
      //     builder: (context, snapshot) {
      //       if (snapshot.data != null) {
      //         return HomePage();
      //       }
      //
      //       //return LandingPage();
      //       return LandingPage();
      //     }),
    );
  }
}
