import 'package:flutter/material.dart';
import 'MyPalette.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
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

class AdvisementPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class LargeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      // title: Text("Alert", style: TextStyle(color: Colors.white, fontSize: 30),),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Container(
        height: height * 0.52,
        width: width * 0.3,
        decoration: BoxDecoration(
          // color: MyPalette.white,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              MyPalette.petalPink,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              color: MyPalette.brightMagenta,
              blurRadius: 16,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.only(
            top: 0.05 * height,
            left: 0.03 * width,
            right: 0.03 * width,
            bottom: 0.03 * height,
          ),
          child: Column(
            children: [
              ///Text
              Padding(
                padding: EdgeInsets.only(
                  top: 0.05 * height,
                ),
                child: Text(
                  "The application is currently in the pre-release stage, if you do not have approval of the developers, you will be unable to link your spotify account",
                  style: TextStyle(
                    color: MyPalette.slateBlue,
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 0.05 * height),

              ///Button
              confirmBtn(fontSize: 25),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      // title: Text("Alert", style: TextStyle(color: Colors.white, fontSize: 30),),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Container(
        height: height * 0.32,
        width: width * 0.2,
        decoration: BoxDecoration(
          // color: MyPalette.white,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              MyPalette.petalPink,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              color: MyPalette.brightMagenta,
              blurRadius: 16,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              ///Text
              Expanded(
                child: Text(
                  "The application is currently in the pre-release stage, if you do not have approval of the developers, you will be unable to link your spotify account",
                  style: TextStyle(color: MyPalette.slateBlue, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),

              ///Button
              confirmBtn(fontSize: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class confirmBtn extends StatelessWidget {
  final double fontSize;

  confirmBtn({required this.fontSize});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: BouncingWidget(
          child: Container(
            width: 0.3 * width,
            height: 0.075 * height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  MyPalette.slateBlue,
                  MyPalette.brightMagenta,
                  MyPalette.turqoise,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: MyPalette.brightMagenta,
                  blurRadius: 10,
                )
              ],
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "I understand",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: 'Share Tech',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          onPressed: () => Navigator.pop(context)),
    );
  }
}
