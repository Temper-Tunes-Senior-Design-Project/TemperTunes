import 'dart:math';
import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:simple_animations/simple_animations.dart';

class WaveAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WaveAnimationState();
  }
}

class WaveAnimationState extends State<WaveAnimation> {
  CustomAnimationControl control = CustomAnimationControl.playFromStart;
  double y = 0;
  int duration = 3500;
  int timeBetweenSuccessiveStart = 10;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CustomAnimation<double>(
      tween: Tween(begin: -100, end: timeBetweenSuccessiveStart + 0.0),
      duration: Duration(milliseconds: duration),
      control: control,
      builder: (context, child, value) {
        //print(y);
        return Transform.translate(
          offset: Offset(value, y), // <-- use animated value for x-coordinate

          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: height * 0.29,
                  // decoration: const BoxDecoration(
                  //   image: DecorationImage(
                  //       image: AssetImage("assets/wave.png"),
                  //       filterQuality: FilterQuality.high,
                  //       fit: BoxFit.cover),
                  // ),

                  child: Image(
                    image: AssetImage("assets/wave.png"),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    //   height: double.maxFinite,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      animationStatusListener: (AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            control = CustomAnimationControl.playFromStart;
          });
        }
      },
    );
  }
}
