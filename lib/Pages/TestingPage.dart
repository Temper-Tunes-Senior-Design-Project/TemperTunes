import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/CameraPage.dart';
import '../Widgets/widgets.dart';
import 'package:flutter/foundation.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
    );
  }
}

class LargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // return SingleChildScrollView(
    //     child: Container(
    //   width: width,
    //   height: height,
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //         image: (defaultTargetPlatform == TargetPlatform.iOS ||
    //                 defaultTargetPlatform == TargetPlatform.android)
    //             ? AssetImage("assets/userPageSmall.png")
    //             : AssetImage("assets/userPageLarge.png"),
    //         fit: BoxFit.cover),
    //   ),
    //   child: Center(
    //     child: ElevatedButton(
    //         //Goto: Camera Page
    //         onPressed: () async {
    //           await availableCameras().then((value) => Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => CameraPage())));
    //         },
    //         child: Text("TEST WIDGET")),
    //   ),
    // ));
    return SafeArea(
      child: Text('print'),
    );
  }
}

class TestingPage extends StatelessWidget {
  static const Key PageKey = Key("Testing Page");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: PageKey,

      body: Body(),
    );
  }
}
