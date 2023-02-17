import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/SignupPage.dart';
import 'package:mood_swing/Pages/UserPage.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../Widgets/widgets.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'dart:math' as math show pi;
import 'package:sidebarx/sidebarx.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';




import 'UserPage.dart';
import 'LoginPage.dart';

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
      return Scaffold(
        body:Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/appBarBG.png"),
              fit: BoxFit.cover),
        ),
          child: Container(
            alignment: Alignment.center,
             padding: EdgeInsets.only(bottom: 0.1*height,),
            child: Ripple(),

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
  ///initialize the demo widget


  ///title of the app

  @override
  State<Ripple> createState() => _Ripple();
}

class _Ripple extends State<Ripple> {
  @override
  Widget build(BuildContext context) => Scaffold(

    body: Center(
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




