import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
            children: [Body()]
        )
    );
  }
}

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
            padding: EdgeInsets.only(top: 0.02*height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left:0.02*width),
                      child: Icon(
                        IconData(0xf05bc, fontFamily: 'MaterialIcons'),
                        color: Colors.white,
                        size: 40,
                      )
                    )
                  ]
                )
              ),
              Container(
                height: height*0.7,
                width: width*0.3,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Container(
                    alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(top: height*0.02),
                        child: Image.asset(
                              "assets/music_swing_logo_small.png",
                              scale: 2.5)),
                    ///Icon for user
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: width*0.02, top: height*0.02),
                        //icon for user
                        child: Icon(
                          IconData(0xe491, fontFamily: 'MaterialIcons'),
                          color: MyPalette.white,
                          size: 30,
                        )
                    ),
                    ///Horizontal line
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
                    ///password icon
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 0.02*width, top: height*0.02),
                        child: Icon(
                          IconData(0xe3ae, fontFamily: 'MaterialIcons'),
                          color: MyPalette.white,
                          size: 30,
                        )
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
                    ///Buttons
                    //Login button
                    Container(
                      padding: EdgeInsets.only(top:0.016*height),
                        child: Container(
                        width: 0.27*width,
                        height: 0.06*height,
                        decoration: BoxDecoration(
                          color: MyPalette.slateBlue,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Login", textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Share Tech',
                                color: Colors.white,
                              )
                          )
                        )
                    )
                    ),
                    //Register Button
                    Container(
                        padding: EdgeInsets.only(top:0.023*height),
                        child: Container(
                            width: 0.27*width,
                            height: 0.06*height,
                            decoration: BoxDecoration(
                                color: MyPalette.slateBlue,
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text("Register", textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Share Tech',
                                      color: Colors.white,
                                    )
                                )
                            )
                        )
                    ),
                    ///Forgot Password
                    Container(
                      padding: EdgeInsets.only(top:0.04*height),
                      child: Text('Forgot your password?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Maven Pro',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: MyPalette.turqoise,
                        )
                      )
                    )
                  ]
                )
              )
            ]
          )
        )
      )
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
          padding: EdgeInsets.only(top: 0.025*height),
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
                      )
                    ),
                  ]
                )
              ),
              Container(
                child: Column (
                  children: [
                    ///Logo
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: height*0.02, bottom: height*0.022),
                      child: Image.asset("assets/music_swing_logo_small.png", scale: 2.5)),
                    ///User input area
                    Container(
                      padding: EdgeInsets.only(left:0.12*width),
                      alignment: Alignment.topLeft,
                      child: Icon(
                        IconData(0xe491, fontFamily: 'MaterialIcons'),
                        color: MyPalette.white,
                        size: 30,
                      ),
                    ),
                    ///Horizontal line
                    Container(
                      padding: EdgeInsets.only(
                        left: 0.1*width,
                        right: 0.1*width,
                        top:3, bottom: height*0.07,
                      ),
                        child: const Divider(
                          height: 8,
                          thickness: 2,
                          color: Colors.white,
                        )
                    ) ,
                   /// user icon
                   Container(
                     padding: EdgeInsets.only(left:0.12*width),
                     alignment: Alignment.topLeft,
                     child: Icon(
                       IconData(0xe3ae, fontFamily: 'MaterialIcons'),
                       color: MyPalette.white,
                       size: 30,
                       )
                     ),
                   ///Horizontal line
                   Container(
                     padding: EdgeInsets.only(
                       left: 0.1*width, right:0.1*width,top:3, bottom:height*0.05),
                     child: const Divider(
                       height: 8,
                       thickness: 2,
                       color: Colors.white,
                     )
                   ),
                   ///Buttons
                    //Login Button
                    Container(
                      width: 0.8*width,
                      height: 0.06*height,
                      decoration: BoxDecoration(
                        color: MyPalette.slateBlue,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                      child:Align(
                        alignment: Alignment.center,
                        child: Text("Login", textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Share Tech',
                            color: Colors.white,
                          )
                        ),
                      )
                    ),
                    ///Register button
                    Container(
                        width: 0.8*width,
                        height: 0.06*height,
                        decoration: BoxDecoration(
                            color: MyPalette.slateBlue,
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        child:Align(
                          alignment: Alignment.center,
                            child: Text("Login", textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Share Tech',
                                color: Colors.white,)
                            ),
                        )
                    )
                ])
              )
            ]
          )
        )
      )
    );
  }
}

