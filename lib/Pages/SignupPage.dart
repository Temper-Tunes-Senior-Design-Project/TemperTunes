import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/LoginPage.dart';
import 'package:mood_swing/Utilities/AuthRouter.dart';
import '../Widgets/widgets.dart';

TextEditingController usernameController = new TextEditingController();
TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
TextEditingController passwordController2 = new TextEditingController();

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
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/loginPageLarge.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          ///back arrow
          padding: EdgeInsets.only(top: 0.03 * height, left: 0.06 * width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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

              ///Main Container
              Container(
                height: height * 0.75,
                width: width * 0.3,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    ///App logo
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: height * 0.02),
                      child: Image.asset("assets/music_swing_logo_small.png",
                          scale: 2.3),
                    ),

                    ///Username
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 0.03 * width, bottom: 0),
                          alignment: Alignment.topLeft,
                          child: TextField(
                            controller: usernameController,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                enabledBorder: InputBorder.none,
                                labelText: 'Please enter your username',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54)),
                          ),
                        ),

                        ///Horizontal line
                        Container(
                          padding: EdgeInsets.only(
                            left: 0.03 * width,
                            right: 0.03 * width,
                            top: 0,
                          ),
                          child: const Divider(
                            height: 5,
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
                          padding: EdgeInsets.only(
                              left: 0.03 * width, top: height * 0.01),
                          alignment: Alignment.topLeft,
                          child: TextField(
                            controller: emailController,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'Email',
                                enabledBorder: InputBorder.none,
                                labelText: 'Please your email',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54)),
                          ),
                        ),

                        ///Horizontal line
                        Container(
                          padding: EdgeInsets.only(
                              left: 0.03 * width, right: 0.03 * width),
                          child: const Divider(
                            height: 8,
                            thickness: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    ///Password
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 0.03 * width, top: height * 0.01),
                          alignment: Alignment.topLeft,
                          child: TextField(
                            controller: passwordController2,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'Confirm Password',
                                enabledBorder: InputBorder.none,
                                labelText: 'Please confirm your password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54)),
                          ),
                        ),

                        ///Horizontal line
                        Container(
                            padding: EdgeInsets.only(
                                left: 0.02 * width,
                                right: 0.02 * width,
                                top: 0),
                            child: const Divider(
                              height: 8,
                              thickness: 2,
                              color: Colors.white,
                            )),
                      ],
                    ),

                    ///Confirm Password
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 0.03 * width, top: height * 0.01),
                          alignment: Alignment.topLeft,
                          child: TextField(
                            controller: passwordController2,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'Confirm Password',
                                enabledBorder: InputBorder.none,
                                labelText: 'Please confirm your password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54)),
                          ),
                        ),

                        ///Horizontal line
                        Container(
                            padding: EdgeInsets.only(
                                left: 0.02 * width,
                                right: 0.02 * width,
                                top: 0),
                            child: const Divider(
                              height: 8,
                              thickness: 2,
                              color: Colors.white,
                            )),
                      ],
                    ),

                    ///Forgot Password
                    Container(
                      padding: EdgeInsets.only(top: 0.02 * height),
                      child: Column(
                        children: [
                          Text(
                            'Already have an account?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                TextButton(
                                  child: Text(
                                    'Go to login',
                                    style: TextStyle(
                                      fontFamily: 'Maven Pro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: MyPalette.turqoise,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                ),
                              ],
                            ),
                          ),
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
              ///back button
              Container(
                child: Row(
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
                        onPressed: () => Navigator.pop(context)),
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
                          top: height * 0.02, bottom: height * 0.01),
                      child: Image.asset("assets/music_swing_logo_small.png",
                          scale: 2.5),
                    ),

                    ///Username
                    Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 0.12 * width, bottom: 0),
                          alignment: Alignment.topLeft,
                          child: TextField(
                            controller: usernameController,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: Colors.white),
                                ),
                                labelText: 'Please enter your username',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54)),
                          ),
                        ),

                        ///Horizontal line
                        Container(
                          padding: EdgeInsets.only(
                            left: 0.1 * width,
                            right: 0.1 * width,
                            top: 0,
                          ),
                          child: const Divider(
                            height: 5,
                            thickness: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    ///Email
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 0.12 * width, top: height * 0.01),
                          alignment: Alignment.topLeft,
                          child: TextField(
                            controller: emailController,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'Email',
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: Colors.white),
                                ),
                                labelText: 'Please your email',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54)),
                          ),
                        ),

                        ///Horizontal line
                        Container(
                          padding: EdgeInsets.only(
                              left: 0.1 * width, right: 0.1 * width),
                          child: const Divider(
                            height: 8,
                            thickness: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    ///Password
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 0.12 * width, top: height * 0.01),
                          alignment: Alignment.topLeft,
                          child: TextField(
                            controller: passwordController,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'Password',
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: Colors.white),
                                ),
                                labelText: 'Please enter your password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54)),
                          ),
                        ),

                        ///Horizontal line
                        Container(
                            padding: EdgeInsets.only(
                                left: 0.1 * width, right: 0.1 * width, top: 0),
                            child: const Divider(
                              height: 8,
                              thickness: 2,
                              color: Colors.white,
                            )),
                      ],
                    ),

                    ///Confirm Password
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 0.12 * width, top: height * 0.01),
                          alignment: Alignment.topLeft,
                          child: TextField(
                            controller: passwordController2,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'Confirm Password',
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: Colors.white),
                                ),
                                labelText: 'Please confirm your password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54)),
                          ),
                        ),

                        ///Horizontal line
                        Container(
                            padding: EdgeInsets.only(
                                left: 0.1 * width, right: 0.1 * width, top: 0),
                            child: const Divider(
                              height: 8,
                              thickness: 2,
                              color: Colors.white,
                            )),
                      ],
                    ),

                    ///Forgot Password
                    Container(
                      padding: EdgeInsets.only(top: 0.03 * height),
                      child: Column(
                        children: [
                          ///Regular Text
                          Text(
                            'Forgot your password?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),

                          ///Linked text to login
                          Container(
                            alignment: Alignment.center,
                            child: TextButton(
                              child: Text(
                                'Go to login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Maven Pro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: MyPalette.turqoise,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                            ),
                          ),
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

void signup()
{
   AuthRouter().registerUser(emailController.text, passwordController.text, (){});
   print("Registered User");
}


class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, body: Column(children: [Body()]));
  }
}
