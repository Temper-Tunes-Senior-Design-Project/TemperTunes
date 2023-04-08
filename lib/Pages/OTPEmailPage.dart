//OTP EMAIL
import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/VerificationPage.dart';
import '../Widgets/widgets.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

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
      child: SafeArea(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/loginPageLarge.png"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 0.01 * height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  //back button
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            TextButton(
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                              ),
                              child: Icon(
                                IconData(0xf05bc, fontFamily: 'MaterialIcons'),
                                color: Colors.white,
                                size: 35,
                              ),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ///Main Container
                Container(
                  height: height * 0.8,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(
                            top: height * 0.03, bottom: 0.04 * height),
                        child: Image.asset("assets/music_swing_logo_small.png",
                            scale: 2.0),
                      ),

                      ///Title
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'One-tme Password'.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 38,
                            fontFamily: 'Share Tech',
                            color: MyPalette.lightPurple,
                          ),
                        ),
                      ),

                      ///Subheading
                      Container(
                        padding: EdgeInsets.only(
                            left: width * 0.02,
                            right: width * 0.02,
                            top: 0.02 * height),
                        child: Text(
                          'We will send you a one-time passcode to your registered email.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Maven Pro'),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      ///Spacer
                      SizedBox(
                        height: 0.03 * height,
                      ),

                      ///Email Input Area
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ///TextField
                          Container(
                            padding:
                                EdgeInsets.only(left: 0.02 * width, bottom: 0),
                            child: TextField(
                              textAlign: TextAlign.left,
                              cursorColor: Colors.white,
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  IconData(0xe22a, fontFamily: 'MaterialIcons'),
                                  color: Colors.white,
                                  size: 35,
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 20, color: Colors.transparent),
                                ),
                                labelText: 'Please enter your email',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),

                          ///Horizontal line
                          Container(
                            padding: EdgeInsets.only(
                              left: 0.02 * width,
                              right: 0.02 * width,
                              top: 0,
                              bottom: height * 0.03,
                            ),
                            child: const Divider(
                              height: 0,
                              thickness: 2,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      ///Buttons
                      //Login button
                      Container(
                        padding: EdgeInsets.only(top: 0.016 * height),
                        child: BouncingWidget(
                            child: Container(
                              width: 0.2 * width,
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
                                    blurRadius: 16,
                                  )
                                ],
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Send Code",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Share Tech',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VerificationPage(),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            //set img to bg of body
            image: DecorationImage(
                image: AssetImage("assets/loginPageSmall.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              BackArrowBtn(),

              ///Main Container
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    ///Logo
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(
                          top: height * 0.01, bottom: height * 0.012),
                      child: Image.asset("assets/music_swing_logo_small.png",
                          scale: 2.0),
                    ),

                    ///spacer
                    SizedBox(height: 0.02 * height),

                    ///Title
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'One-tme Password'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                          fontFamily: 'Share Tech',
                          color: MyPalette.lightPurple,
                        ),
                      ),
                    ),

                    ///spacer
                    SizedBox(height: 0.02 * height),

                    ///Subheading
                    Container(
                      padding: EdgeInsets.only(
                          left: width * 0.1, right: width * 0.1),
                      child: Text(
                        'We will send you a one-time passcode to your registered email.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Maven Pro'),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    SizedBox(height: 0.02 * height),

                    /// Enter Email
                    Column(
                      children: [
                        ///Text field
                        Container(
                          padding: EdgeInsets.only(
                              left: 0.12 * width, top: 0.02 * height),
                          child: TextField(
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                prefixIcon: Align(
                                  widthFactor: 1.0,
                                  child: Icon(
                                    IconData(0xe22a,
                                        fontFamily: 'MaterialIcons'),
                                    color: MyPalette.white,
                                    size: 32,
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 0, color: Colors.white),
                                ),
                                labelText: 'Please enter your password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54)),
                          ),
                        ),

                        ///Horizontal line
                        Container(
                          padding: EdgeInsets.only(
                              left: 0.1 * width,
                              right: 0.1 * width,
                              top: 3,
                              bottom: height * 0.045),
                          child: const Divider(
                            height: 5,
                            thickness: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    ///Buttons
                    //Send Button
                    Container(
                      //padding: EdgeInsets.only(top: height*0.03),
                      child: BouncingWidget(
                          child: Container(
                            width: 0.5 * width,
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: MyPalette.brightMagenta,
                                  blurRadius: 16,
                                ),
                              ],
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Send Code",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Share Tech',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerificationPage(),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPEmailPage extends StatelessWidget {
  const OTPEmailPage({super.key});

  @override
  Widget build(Object context) {
    //Materialapp debugger false
    return Scaffold(resizeToAvoidBottomInset: false, body: Body());
  }
}
