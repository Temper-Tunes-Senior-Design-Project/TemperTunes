import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';
import 'package:flutter/foundation.dart';

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
            Container(
              padding: EdgeInsets.only(top: 0.1 * height),
              child: FittedBox(
                alignment: Alignment.center,
                child: Text(
                  'Verification',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    fontFamily: 'Share Tech',
                    color: MyPalette.lightPurple,
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 0.01 * height),
              child: FittedBox(
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
              ),
            ),

            ///Options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: LargeOptButton(
                    context: context,
                    text: 'Use Camera Only',
                    image: Image.asset('assets/cameraOnly.png'),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 20),
                LargeOptButton(
                  context: context,
                  text: 'Use Sensor Only',
                  image: Image.asset('assets/sensorOnly.png'),
                  onPressed: () {},
                ),
                SizedBox(width: 20),
                LargeOptButton(
                  context: context,
                  text: 'Use Sensor Only',
                  image: Image.asset('assets/both.png'),
                  onPressed: () {},
                ),
                SizedBox(width: 20),
                LargeOptButton(
                  context: context,
                  text: 'Use Sensor Only',
                  image: Image.asset('assets/neither.png'),
                  onPressed: () {},
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
            ///Title
            Container(
              padding: EdgeInsets.only(top: 10),
              child: FittedBox(
                alignment: Alignment.center,
                child: Text(
                  'Verification',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    fontFamily: 'Share Tech',
                    color: MyPalette.lightPurple,
                  ),
                ),
              ),
            ),

            //Options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: SmallOptButton(
                    context: context,
                    text: 'Use Camera Only',
                    icon: Icons.photo_camera,
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 20),
                SmallOptButton(
                  context: context,
                  text: 'Use Sensor Only',
                  icon: Icons.photo_camera,
                  onPressed: () {},
                ),
                SizedBox(width: 20),
                SmallOptButton(
                  context: context,
                  text: 'Use Sensor Only',
                  icon: Icons.photo_camera,
                  onPressed: () {},
                ),
                SizedBox(width: 20),
                SmallOptButton(
                  context: context,
                  text: 'Use Sensor Only',
                  icon: Icons.photo_camera,
                  onPressed: () {},
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
  final void Function()? onPressed;
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
      padding: const EdgeInsets.only(
        top: 100,
      ),
      child: Stack(
        children: [
          Container(
            height: 0.4 * height,
            width: 0.20 * width,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: Colors.purple,
            ),
          ),
          Container(
            decoration: BoxDecoration(),
            child: Icon(icon, size: height * 0.1, color: MyPalette.darkBlue),
          ),
        ],
      ),
    );
  }
}

class LargeOptButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final BuildContext context;
  final Image image;
  const LargeOptButton(
      {required this.context,
      required this.text,
      required this.image,
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
        fit: StackFit.passthrough,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 0.4 * height,
            width: 0.20 * width,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: Colors.purple,
            ),
          ),
          Positioned(
            top: -height * 0.05,
            child: Container(
              alignment: Alignment.center,
              height: height * 0.2,
              width: width * 0.2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent,
              ),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: image,
                ),
              ),
              // child: Align(
              //   alignment: Alignment.topLeft,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Icon(
              //         icon,
              //         size: height * 0.05,
              //         color: Colors.white,
              //       ),
              //     ],
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenerationOptions extends StatelessWidget {
  static const Key PageKey = Key("Testing Page");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: PageKey,
      body: Body(),
    );
  }
}
