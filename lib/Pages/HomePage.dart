import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../Widgets/widgets.dart';
//import 'package:simple_ripple_animation/simple_ripple_animation.dart';

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
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/loginPageLarge.png"),
                  fit: BoxFit.cover),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: width,
                      height: height,
                      child: SidebarLarge(),
                    ),
                  ],
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
                    child: Ripple(),
                  )),
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

///Ripple animation demo
class Ripple extends StatefulWidget {
  @override
  State<Ripple> createState() => _Ripple();
}

class _Ripple extends State<Ripple> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RippleAnimation(
                child: CircleAvatar(
                  minRadius: 110,
                  maxRadius: 110,
                  backgroundImage: AssetImage("assets/circleLogoSmall.png"),
                ),
                color: MyPalette.circleIcon,
                delay: const Duration(milliseconds: 300),
                repeat: true,
                minRadius: 85,
                ripplesCount: 8,
                duration: const Duration(milliseconds: 6 * 300),
              )
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
}
