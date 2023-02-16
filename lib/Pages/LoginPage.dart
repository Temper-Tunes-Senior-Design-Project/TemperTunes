import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/SignupPage.dart';
import '../Utilities/AuthRouter.dart';
import '../Widgets/widgets.dart';
import 'HomePage.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}

TextEditingController _emailController = new TextEditingController();
TextEditingController _passwordController = new TextEditingController();

class LargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/LoginPageLarge.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 0.03 * height, left: 0.06 * width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          ElevatedButton(
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
                      padding: EdgeInsets.only(top: height * 0.02),
                      child: Image.asset("assets/music_swing_logo_small.png",
                          scale: 2.3),
                    ),

                    ///User input area
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ///TextField
                        Container(
                          padding:
                              EdgeInsets.only(left: 0.02 * width, bottom: 0),
                          child: TextField(
                            controller: _emailController,
                            textAlign: TextAlign.left,
                            cursorColor: Colors.white,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                IconData(0xe491, fontFamily: 'MaterialIcons'),
                                color: MyPalette.white,
                                size: 34,
                              ),
                              hintStyle: TextStyle(color: Colors.white60),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colors.transparent),
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
                            height: 5,
                            thickness: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    ///password icon
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ///TextField
                        Container(
                          padding:
                              EdgeInsets.only(left: 0.02 * width, bottom: 0),
                          child: TextField(
                            controller: _passwordController,
                            textAlign: TextAlign.left,
                            cursorColor: Colors.white,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                IconData(0xf052b, fontFamily: 'MaterialIcons'),
                                color: MyPalette.white,
                                size: 34,
                              ),
                              hintStyle: TextStyle(color: Colors.white60),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colors.transparent),
                              ),
                              labelText: 'Please enter your password',
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
                            height: 5,
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
                      child: GestureDetector(
                        onTap: (){login(context);},
                        child: Container(
                          width: 0.27 * width,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Login",
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
                    ),

                    //Register Button
                    Container(
                      child: TextButton(
                        child: Container(
                          padding: EdgeInsets.only(top: 0.03 * height),
                          child: Container(
                            width: 0.27 * width,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Register",
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                        ),
                      ),
                    ),

                    ///Forgot Password
                    Container(
                      padding: EdgeInsets.only(top: 0.08 * height),
                      child: Text(
                        'Forgot your password?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Maven Pro',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: MyPalette.turqoise,
                        ),
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
        height: height,
        width: width,
        decoration: BoxDecoration(
          //set img to bg of body
          image: DecorationImage(
              image: AssetImage("assets/loginPageSmall.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 0.01 * width, top: 0.06 * height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                ///Back button
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
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
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ///Logo
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(
                          top: height * 0.01, bottom: height * 0.012),
                      child: Image.asset("assets/music_swing_logo_small.png",
                          scale: 2.5),
                    ),

                    ///User input area
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ///TextField
                        Container(
                          padding:
                              EdgeInsets.only(left: 0.12 * width, bottom: 0),
                          child: TextField(
                            controller: _emailController,
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
                                  heightFactor: 1.0,
                                  child: Icon(
                                    IconData(0xe491,
                                        fontFamily: 'MaterialIcons'),
                                    color: MyPalette.white,
                                    size: 30,
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(width:10, color:Colors.white),),
                                labelText: 'Please enter your email',
                                labelStyle: TextStyle(fontSize: 15,color: Colors.white54)
                              ),
                            ),
                          ),


                        ///Horizontal line
                        Container(
                          padding: EdgeInsets.only(
                            left: 0.1 * width,
                            right: 0.1 * width,
                            top: 0,
                            bottom: height * 0.03,
                          ),
                          child: const Divider(
                            height: 5,
                            thickness: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    /// Password icon
                    Column(
                      children: [
                        ///Text field
                        Container(
                          padding:
                              EdgeInsets.only(left: 0.12 * width, bottom: 0),
                          child: TextField(
                            controller: _passwordController,
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
                                    IconData(0xf052b,
                                        fontFamily: 'MaterialIcons'),
                                    color: MyPalette.white,
                                    size: 32,
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(width:0, color:Colors.white),),
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
                    //Login Button
                    Container(
                      //padding: EdgeInsets.only(top: height*0.03),
                      child: GestureDetector(
                        onTap: (){login(context);},
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
                              "Login",
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
                    ),

                    ///Register button
                    Container(
                      child: TextButton(
                        child: Container(
                          padding: EdgeInsets.only(top: height * 0.015),
                          child: Container(
                            width: 0.8 * width,
                            height: 0.07 * height,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Register",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Share Tech',
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                        ),
                      ),
                    ),

                    ///Forgot Password
                    Container(
                      padding: EdgeInsets.only(top: 0.01 * height),
                      child: Container(
                        child: Text(
                          'Forgot your password?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Maven Pro',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: MyPalette.turqoise,
                          ),
                        ),
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

void login(BuildContext context) async {
  AuthRouter().login(_emailController.text, _passwordController.text, () {});
  if(AuthRouter().isLoggedIn()) {
    Navigator.push(context, MaterialPageRoute(builder: (ctxt) => HomePage()));
  }
}


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [Body()]),
    );
  }
}
