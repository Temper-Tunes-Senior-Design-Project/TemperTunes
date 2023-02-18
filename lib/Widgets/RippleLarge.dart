import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../Widgets/widgets.dart';

///Ripple animation demo
class RippleLarge extends StatefulWidget {
  @override
  State<RippleLarge> createState() => _RippleLarge();
}

class _RippleLarge extends State<RippleLarge> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RippleAnimation(
                child: CircleAvatar(
                  minRadius: 150,
                  maxRadius: 150,
                  backgroundImage: AssetImage("assets/pcircle.png"),
                ),
                color: MyPalette.magenta,
                delay: const Duration(milliseconds: 300),
                repeat: true,
                minRadius: 145,
                ripplesCount: 8,
                duration: const Duration(milliseconds: 6 * 300),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
}
