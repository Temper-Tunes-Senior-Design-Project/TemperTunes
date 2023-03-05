import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../Widgets/widgets.dart';

///Ripple animation demo
class RippleSmall extends StatefulWidget {
  @override
  State<RippleSmall> createState() => _RippleSmall();
}

class _RippleSmall extends State<RippleSmall> {
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
                  backgroundImage: AssetImage("assets/pcircle.png"),
                ),
                color: MyPalette.circleIcon,
                delay: const Duration(milliseconds: 300),
                repeat: true,
                minRadius: 115,
                ripplesCount: 8,
                duration: const Duration(milliseconds: 6 * 300),
              )
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
}
