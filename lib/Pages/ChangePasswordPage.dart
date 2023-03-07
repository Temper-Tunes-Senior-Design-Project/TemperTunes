import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';
import 'package:mood_swing/Pages/HomePage.dart';

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
          padding: EdgeInsets.only(top: 0.03 * height),
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
                height: height * 0.8,
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

                    ///Current password
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 0.03 * width, bottom: 0),
                          alignment: Alignment.topLeft,
                          child: TextField(
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
                                hintText: 'Current Password',
                                labelText: 'Please enter your current username',
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

                    ///New Password
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 0.03 * width, top: height * 0.01),
                          alignment: Alignment.topLeft,
                          child: TextField(
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'New Password',
                                enabledBorder: InputBorder.none,
                                labelText: 'Please your new password',
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

                    ///Confirm new password
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 0.03 * width, top: height * 0.01),
                          alignment: Alignment.topLeft,
                          child: TextField(
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'Confirm New Password',
                                enabledBorder: InputBorder.none,
                                labelText: 'Please confirm your new password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54)),
                          ),
                        ),

                        ///Horizontal line
                        Container(
                          padding: EdgeInsets.only(
                              left: 0.02 * width, right: 0.02 * width, top: 0),
                          child: const Divider(
                            height: 8,
                            thickness: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    ///Register button
                    Container(
                      child: TextButton(
                        child: Container(
                          padding: EdgeInsets.only(top: height * 0.02),
                          child: Container(
                            width: 0.5 * width,
                            height: 0.056 * height,
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
                                  builder: (context) => HomePage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                        ),
                      ),
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
                                            builder: (context) => HomePage()));
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

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  //GlobalKey<FormState> _key = new GlobalKey();
  //bool _validate = false;
  //bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
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
                          top: height * 0.02, bottom: height * 0.005),
                      child: Image.asset("assets/music_swing_logo_small.png",
                          scale: 2.5),
                    ),

                    ///current password
                    Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 0.12 * width, bottom: 0),
                          alignment: Alignment.topLeft,
                          child: TextField(
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'Current Password',
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: Colors.white),
                                ),
                                labelText: 'Please enter your current password',
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

                    ///New password
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 0.12 * width, top: height * 0.005),
                          alignment: Alignment.topLeft,
                          child: TextField(
                            style: TextStyle(
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'New Password',
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: Colors.white),
                                ),
                                labelText: 'Please enter your new password',
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

                    ///Confirm new password
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 0.12 * width, top: height * 0.005),
                          alignment: Alignment.topLeft,
                          child: TextField(
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
                                labelText: 'Please confirm your new password',
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
                          ),
                        ),
                      ],
                    ),

                    ///Register Button
                    Container(
                      child: TextButton(
                        child: Container(
                          padding: EdgeInsets.only(top: height * 0.015),
                          child: Container(
                            width: 0.8 * width,
                            height: 0.05 * height,
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
                              child: Text("Submit",
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
                                  builder: (context) => HomePage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                        ),
                      ),
                    ),

                    ///Already Have an account
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

class ChangePasswordPage extends StatefulWidget {
  _ChangePasswordPageState createState() => _ChangePasswordPageState();


  Widget build(Object context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, body: Column(children: [Body()]));
  }
}