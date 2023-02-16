import 'package:flutter/material.dart';
import 'package:lecle_bubble_timeline/lecle_bubble_timeline.dart';
import 'package:lecle_bubble_timeline/models/timeline_item.dart';
import 'package:mood_swing/Pages/SignupPage.dart';
import 'package:mood_swing/Pages/UserPage.dart';
import '../Widgets/widgets.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'dart:math' as math show pi;
import 'package:sidebarx/sidebarx.dart';


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
              image: AssetImage("assets/userPageLarge.png"),
              fit: BoxFit.cover),
        ),
          child: Stack(
            children:
              [
                BubbleTimeline(
                  bubbleSize: 100,
                  stripColor: Colors.teal,
                  dividerCircleColor: Colors.white,
                  // List of Timeline Bubble Items
                  items: [
                    TimelineItem(
                      title: 'Boat',
                      subtitle: 'Travel through Oceans',
                      icon: Icon(
                        Icons.directions_boat,
                        color: Colors.black,
                      ),
                      bubbleColor: Colors.red,
                      description: 'Description for boat',
                      titleStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700, color: Colors.white),
                      subtitleStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white70),
                      descriptionStyle: TextStyle(fontSize: 12.0, color: Colors.white60),
                    ),
                    TimelineItem(
                      title: 'Bike',
                      subtitle: 'Road Trips are best',
                      icon: Icon(
                        Icons.directions_bike,
                        color: Colors.black,
                      ),
                      bubbleColor: Colors.yellow,
                      description: 'Description for bike',
                      titleStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700, color: Colors.white),
                      subtitleStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white70),
                      descriptionStyle: TextStyle(fontSize: 12.0, color: Colors.white60),
                    ),
                    TimelineItem(
                      title: 'Bus',
                      subtitle: 'I like to go with friends',
                      icon: Icon(
                        Icons.directions_bus,
                        color: Colors.black,
                      ),
                      bubbleColor: Colors.green,
                      description: 'Description for bus',
                      titleStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700, color: Colors.white),
                      subtitleStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white70),
                      descriptionStyle: TextStyle(fontSize: 12.0, color: Colors.white60),
                    ),

                    TimelineItem(
                      title: 'Bike',
                      subtitle: 'Road Trips are best',
                      icon: Icon(
                        Icons.directions_bike,
                        color: Colors.black,
                      ),
                      bubbleColor: Colors.yellow,
                      description: 'Description for bike',
                      titleStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700, color: Colors.white),
                      subtitleStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white70),
                      descriptionStyle: TextStyle(fontSize: 12.0, color: Colors.white60),
                    ),
                  ],

                ),
              ],
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



