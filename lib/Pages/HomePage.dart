import 'package:flutter/material.dart';
import 'package:mood_swing/Widgets/RippleLarge.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../Widgets/widgets.dart';

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
                  image: AssetImage("assets/ribbon_lowered.png"),
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
    );
  }
}

class HomePage extends StatelessWidget {
  //const HomePage({super.key})

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}
