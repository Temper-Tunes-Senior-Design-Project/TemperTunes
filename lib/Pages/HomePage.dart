import 'package:flutter/material.dart';
import 'package:mood_swing/Widgets/RippleLarge.dart';
import '../Widgets/widgets.dart';
import 'package:camera/camera.dart';

Key UserButtonKey = Key("User Button");

List<CameraDescription> cameras = [];

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}

class LargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/userPageSmall.png"),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  //  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 0.14 * height),
                  child: RippleLarge(),
                ),
                Container(
                  child: SidebarLarge(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: SidebarSmall(
            Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  padding: EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ribbon_lowered.png"),
                        fit: BoxFit.cover),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 0.3 * height),
                    child: RippleSmall(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key, bool shouldOnboard = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}
