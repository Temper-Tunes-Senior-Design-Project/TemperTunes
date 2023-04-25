import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';

import 'package:mood_swing/Pages/CameraPage.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:mood_swing/Pages/PresetsPage.dart';

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

    return SafeArea(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/userPageLarge.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            BackArrowBtn(),
            Container(
              padding: EdgeInsets.only(top: 0.1 * height),
              child: Title(),
            ),

            Container(
              padding: EdgeInsets.only(top: 0.01 * height),
              child: Subtitle(),
            ),

            SizedBox(height: 20),

            ///Options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LargeOptButton(
                  context: context,
                  text: 'Use Camera Only',
                  icon: GenerationIcons.cameraOnly,
                  onPressed: () {
                    Navigator.pushNamed(context, '/camera');
                  },
                ),
                SizedBox(width: 20),
                LargeOptButton(
                  context: context,
                  text: 'Use Sensor Only',
                  icon: GenerationIcons.sensorOnly,
                  onPressed: () {
                    Navigator.pushNamed(context, '/bluetooth');
                  },
                ),
                SizedBox(width: 20),
                LargeOptButton(
                  context: context,
                  text: 'Use Both',
                  icon: GenerationIcons.both,
                  onPressed: () {
                    Navigator.pushNamed(context, '/camera');
                  },
                ),
                SizedBox(width: 20),
                LargeOptButton(
                  context: context,
                  text: 'Use Presets',
                  icon: GenerationIcons.neither,
                  onPressed: () {
                    Navigator.pushNamed(context, 'presets');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/userPageLarge.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            BackArrowBtn(),

            ///Title
            Container(
              child: Title(),
            ),

            Container(
              padding: EdgeInsets.only(
                top: 0.01 * height,
                right: 0.1 * width,
                left: 0.1 * width,
              ),
              child: Subtitle(),
            ),

            //Options
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: SmallOptButton(
                    context: context,
                    text: 'Use Camera Only',
                    icon: GenerationIcons.cameraOnly,
                    onPressed: () {
                      Navigator.pushNamed(context, '/camera');
                    },
                  ),
                ),
                SmallOptButton(
                  context: context,
                  text: 'Use Sensor Only',
                  icon: GenerationIcons.sensorOnly,
                  onPressed: () {},
                ),
                SmallOptButton(
                  context: context,
                  text: 'Use Both',
                  icon: GenerationIcons.both,
                  onPressed: () {},
                ),
                SmallOptButton(
                  context: context,
                  text: 'Use Presets',
                  icon: GenerationIcons.neither,
                  onPressed: () {
                    Navigator.pushNamed(context, '/presets');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SmallOptButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final BuildContext context;
  final IconData icon;
  const SmallOptButton(
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
      padding: EdgeInsets.only(top: 0.04 * height),
      child: BouncingWidget(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ///Rectangle Title holder
            Container(
              height: 0.12 * height,
              width: 0.8 * width,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                color: MyPalette.lightPurple.withOpacity(0.3),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  padding: EdgeInsets.only(left: 0.2 * width),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Maven Pro',
                      fontSize: 20,
                      color: MyPalette.darkTurqoise,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),

            ///Icon holder
            Positioned(
              top: -height * 0.01,
              child: Container(
                height: 0.14 * height,
                width: 0.25 * width,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      MyPalette.hanPurple,
                      MyPalette.brightMagenta,
                      MyPalette.turqoise,
                    ],
                  ),
                ),
                child: Container(
                  constraints: BoxConstraints.expand(width: double.infinity),
                  child: Icon(icon, size: 50, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class LargeOptButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final BuildContext context;
  final IconData icon;
  const LargeOptButton(
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
      padding: EdgeInsets.only(
        top: height * 0.1,
      ),
      child: BouncingWidget(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ///Square
            Container(
              height: 0.4 * height,
              width: 0.20 * width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                color: MyPalette.lightPurple.withOpacity(0.3),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Maven Pro',
                    fontSize: 20,
                    color: MyPalette.darkTurqoise,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            ///Circle Icon
            Positioned(
              top: -height * 0.05,
              child: Container(
                alignment: Alignment.center,
                height: height * 0.2,
                width: width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      MyPalette.hanPurple,
                      MyPalette.brightMagenta,
                      MyPalette.turqoise,
                    ],
                  ),
                ),
                child: Container(
                  constraints: BoxConstraints.expand(width: double.infinity),
                  height: 0.1 * height,
                  child: Icon(icon, size: height * 0.1, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.center,
      child: Text(
        'Mood Selection',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 60,
          fontFamily: 'Share Tech',
          color: MyPalette.lightPurple,
        ),
      ),
    );
  }
}

class Subtitle extends StatelessWidget {
  const Subtitle({super.key});
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.center,
      child: Text(
        'Please select how you would like us to get your mood',
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'Maven Pro',
          fontWeight: FontWeight.w200,
          color: Colors.white60,
        ),
      ),
    );
  }
}

class GenerationOptionsPage extends StatelessWidget {
  static const Key PageKey = Key("Testing Page");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: PageKey,
      body: Body(),
    );
  }
}
