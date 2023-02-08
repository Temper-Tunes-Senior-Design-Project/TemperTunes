import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
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

class LargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height,
        decoration:BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/LoginPageLarge.png"), fit: BoxFit.cover),
        ),
        child: Padding(
          ///back arrow
          padding: EdgeInsets.only(top: 0.02*height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left:0.03*width),
                      child: Row(
                        children: [
                          ElevatedButton(
                            child: Icon(
                              IconData(0xf05bc, fontFamily: 'MaterialIcons'),
                              color: Colors.white,
                              size: 40,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ///Main Container
              Container(
                height: height*0.8,
                width: width*0.3,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    ///App logo
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: height*0.02),
                      child: Image.asset(
                          "assets/music_swing_logo_small.png",
                          scale: 2.3),),
                    ///EnterUsername
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: width*0.02, top: height*0.06),
                          alignment: Alignment.topLeft,
                          //icon for user
                          child: Text( 'Username', style: TextStyle(
                            fontFamily: 'Maven Pro',
                            fontWeight: FontWeight.w100,
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                          ),
                        ),
                        ///Horizontal line
                        Container(
                          padding: EdgeInsets.only(
                              left:0.02*width,
                              right: 0.02*width,
                              top: 3),
                          child: const Divider(
                            height: 8,
                            thickness: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    ///Enter Email
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 0.02*width, top: height*0.05),
                          alignment: Alignment.topLeft,
                          child: Text( 'Email', style: TextStyle(
                            fontFamily: 'Maven Pro',
                            fontWeight: FontWeight.w100,
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                          ),
                        ),
                        ///horizontal line
                        Container(
                            padding: EdgeInsets.only(
                                left:0.02*width,
                                right: 0.02*width,
                                top: 3),
                            child: const Divider(
                              height: 8,
                              thickness: 2,
                              color: Colors.white,
                            )
                        ),
                      ],
                    ),
                    ///Password
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 0.02*width, top: height*0.06),
                          alignment: Alignment.topLeft,
                          //icon for user
                          child: Text( 'Password', style: TextStyle(
                            fontFamily: 'Maven Pro',
                            fontWeight: FontWeight.w100,
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                          ),
                        ),
                        ///horizontal line
                        Container(
                            padding: EdgeInsets.only(
                                left:0.02*width,
                                right: 0.02*width,
                                top: 3),
                            child: const Divider(
                              height: 8,
                              thickness: 2,
                              color: Colors.white,
                            )
                        ),
                      ],
                    ),
                    ///Confirm Password
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: width*0.02, top: height*0.06),
                          //icon for user
                          child: Text( 'Confirm Password', style: TextStyle(
                            fontFamily: 'Maven Pro',
                            fontWeight: FontWeight.w100,
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                          ),
                        ),
                        ///horizontal line
                        Container(
                            padding: EdgeInsets.only(
                                left:0.02*width,
                                right: 0.02*width,
                                bottom: 0.02*width,
                                top: 3),
                            child: const Divider(
                              height: 8,
                              thickness: 2,
                              color: Colors.white,
                            )
                        ),
                      ],
                    ),

                    ///Forgot Password
                    Container(
                      padding: EdgeInsets.only(top:0.02*height),
                      child: Column(
                        children: [
                          Text('Already have an account?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text('Go to login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: MyPalette.turqoise,
                            ),
                          )
                        ],
                      ),
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



class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height:height,
        width: width,
        decoration: BoxDecoration(
          //set img to bg of body
          image: DecorationImage(
              image: AssetImage("assets/loginPageSmall.png"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.only(left:0.03*width, top: 0.06*height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              Container(
                ///Back button
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left:0.02*width),
                      child: Icon(
                        IconData(0xf05bc, fontFamily: 'MaterialIcons'),
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column (
                  children: [
                    ///Logo
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: height*0.02, bottom:height*0.05),
                      child: Image.asset("assets/music_swing_logo_small.png", scale: 2.5),),

                    ///Username
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left:0.12*width),
                          alignment: Alignment.topLeft,
                          child: Text( 'Username', style: TextStyle(
                            fontFamily: 'Maven Pro',
                            fontWeight: FontWeight.w100,
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                          ),
                        ),
                        ///Horizontal line
                        Container(
                            padding: EdgeInsets.only(
                              left: 0.1*width,
                              right: 0.1*width,
                              top:3,
                            ),
                            child: const Divider(
                              height: 8,
                              thickness: 2,
                              color: Colors.white,
                            )
                        ),
                      ],
                    ),

                    ///Email
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left:0.12*width, top:height*0.05),
                          alignment: Alignment.topLeft,
                          child: Text( 'Email', style: TextStyle(
                            fontFamily: 'Maven Pro',
                            fontWeight: FontWeight.w100,
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                          ),
                        ),
                        ///Horizontal line
                        Container(
                            padding: EdgeInsets.only(
                                left: 0.1*width, right:0.1*width,top:3),
                            child: const Divider(
                              height: 8,
                              thickness: 2,
                              color: Colors.white,
                            )
                        ),
                      ],
                    ),

                    ///Password
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left:0.12*width, top:height*0.05),
                          alignment: Alignment.topLeft,
                          child: Text( 'Password', style: TextStyle(
                            fontFamily: 'Maven Pro',
                            fontWeight: FontWeight.w100,
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                          ),
                        ),
                        ///Horizontal line
                        Container(
                            padding: EdgeInsets.only(
                                left: 0.1*width, right:0.1*width,top:3),
                            child: const Divider(
                              height: 8,
                              thickness: 2,
                              color: Colors.white,
                            )
                        ),
                      ],
                    ),

                    ///Confirm Password
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left:0.12*width, top:height*0.05),
                          alignment: Alignment.topLeft,
                          child: Text( 'Confirm Password', style: TextStyle(
                            fontFamily: 'Maven Pro',
                            fontWeight: FontWeight.w100,
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                          ),
                        ),
                        ///Horizontal line
                        Container(
                            padding: EdgeInsets.only(
                                left: 0.1*width, right:0.1*width,top:3),
                            child: const Divider(
                              height: 8,
                              thickness: 2,
                              color: Colors.white,
                            )
                        ),
                      ],
                    ),

                    ///Forgot Password
                    Container(
                      padding: EdgeInsets.only(top: 0.05*height),
                      child: Column(
                        children: [
                          ///Regular Text
                          Text('Forgot your password?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          ///Linked text to login
                          Text('Go to login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: MyPalette.turqoise,
                            ),
                          )

                        ],
                      ),
                    ),
                  ],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class PreferencesPage extends StatelessWidget {
  const PreferencesPage ({super.key});

  @override
  Widget build(Object context) {
    //Materialapp debugger false
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
            children: [Body()]
        )
    );
  }
}

