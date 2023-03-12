import 'package:flutter/material.dart';

///import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import '../Widgets/widgets.dart';
//import 'dart:async';

///from https://github.com/adar2378/pin_code_fields/blob/master/example/lib/main.dart

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
    return VerificationLarge(
      email: "jdoe@gmail.com",
    );
  }
}

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerificationSmall(
      email: "jdoe@gmail.com",
    );
  }
}

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              child: Body(),
            ),
          ],
        ),
      ),
    );
  }
}

/*

class VerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: VerifPage(),
    );
  }
}

class VerifPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerifPage> {
  TextEditingController newTextEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    newTextEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: height,
            width: width,
            child: Container(
              decoration:BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/userPageSmall.png"), fit: BoxFit.cover),
              ),
              child: Padding(
                padding: EdgeInsets.only(left:0.01*width, top: 0.06*height),
                child: Container(
                  child: Column(
                    children: [
                      ///back button
                      Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                          ),
                          child: Icon(
                            IconData(0xf05bc, fontFamily: 'MaterialIcons'),
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: () => Navigator.pop(context)
                      ),
                    ],
                  ),

                      Column(
                          children: <Widget>[

                            ///Title
                            Container(
                              padding: EdgeInsets.only(top: height*0.01, bottom:height*0.03),
                              child: Text(
                                'Verification Code',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: MyPalette.lightPurple,
                                    fontFamily: 'Share Tech'
                                ),
                              ),
                            ),

                            ///subtitle
                            Container(
                              child: Text('We have sent a code to @jdoe@gmail.com',
                                style: TextStyle( fontFamily: 'Maven Pro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white),
                              ),
                            ),

                            SizedBox(
                              height: 0.03*height,
                            ),
                            PinCodeFields(
                              length: 4,
                              padding: EdgeInsets.all(8),
                              fieldBorderStyle: FieldBorderStyle.square,
                              responsive: true,
                              fieldHeight: 0.15*height,
                              fieldWidth: 0.15*width,
                              borderWidth: 3.0,
                              activeBorderColor: MyPalette.darkMagenta,
                              activeBackgroundColor: MyPalette.brightMagenta,
                              borderRadius: BorderRadius.circular(15.0),
                              keyboardType: TextInputType.number,
                              autoHideKeyboard: false,
                              fieldBackgroundColor: MyPalette.slateBlue,
                              borderColor: MyPalette.hanPurple,
                              textStyle: TextStyle(
                                fontSize: 30.0,
                                color: MyPalette.dark,
                                fontWeight: FontWeight.bold,
                              ),
                              animationDuration: const Duration(milliseconds: 200),
                              animationCurve: Curves.easeInOut,
                              switchInAnimationCurve: Curves.easeIn,
                              switchOutAnimationCurve: Curves.easeOut,
                              animation: Animations.slideInDown,
                              onComplete: (output) {
                                // Your logic with pin code
                                print(output);
                              },
                            ),

                            ///spacer
                            SizedBox(
                              height: 0.035*height,
                            ),

                            ///button
                            Container(
                              //padding: EdgeInsets.only(top: height*0.03),
                              child: Container(
                                width: 0.8 * width,
                                height: 0.07 * height,
                                decoration: BoxDecoration(
                                  //color: MyPalette.slateBlue,
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        MyPalette.slateBlue,
                                        MyPalette.brightMagenta,
                                        MyPalette.turqoise,
                                      ],
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Submit",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Share Tech',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            ///Resend code
                            Container(
                              padding: EdgeInsets.only(top: 0.03* height),
                              child: Text(
                                'Resend code',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Maven Pro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: MyPalette.turqoise,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ],
        ),
    );
  }
}*/
