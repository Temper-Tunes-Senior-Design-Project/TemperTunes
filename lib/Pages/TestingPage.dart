import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'TEST PAGE',
              style: TextStyle(
                fontSize: 80,
                color: Colors.purple,
              ),
            ),
          ),
          Container(
            child: OptionButton(
              context: context,
              text: 'Use Camera Only',
              icon: Icons.photo_camera,
              onPressed: () {},
            ),
          ),
          SizedBox(width: 10),
          OptionButton(
            context: context,
            text: 'Use Sensor Only',
            icon: Icons.photo_camera,
            onPressed: () {},
          ),
          SizedBox(width: 10),
          OptionButton(
            context: context,
            text: 'Use Sensor Only',
            icon: Icons.photo_camera,
            onPressed: () {},
          ),
          SizedBox(width: 10),
          OptionButton(
            context: context,
            text: 'Use Sensor Only',
            icon: Icons.photo_camera,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final BuildContext context;
  final IconData icon;
  const OptionButton(
      {required this.context,
      required this.text,
      required this.icon,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        top: 100,
      ),
      child: Stack(
        children: [
          Container(
            height: 0.4 * height,
            width: 0.20 * width,
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
          ),
          Icon(icon, size: height * 0.05, color: Colors.grey),
        ],
      ),
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
