import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/LoginPage.dart';
import 'package:mood_swing/Pages/OTPEmailPage.dart';
import '../Widgets/widgets.dart';
import 'package:mood_swing/Pages/HomePage.dart';
import 'package:mood_swing/Utilities/AuthRouter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:async';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}

TextEditingController _currentPasswordController = new TextEditingController();
TextEditingController _newPasswordController = new TextEditingController();
TextEditingController _newPasswordController2 = new TextEditingController();

class LargeScreen extends StatefulWidget {
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  final _formKey = GlobalKey<FormState>();
  //show password
  bool _isVisible = false;

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

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
                        const IconData(0xf05bc, fontFamily: 'MaterialIcons'),
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),

              ///Main Container
              Form(
                key: _formKey,
                child: Container(
                  height: height * 0.8,
                  width: width * 0.3,
                  padding:
                      EdgeInsets.only(left: 0.03 * width, right: 0.03 * height),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      ///App logo
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(top: height * 0.02),
                        child: Image.asset("assets/music_swing_logo_small.png",
                            scale: 2.3),
                      ),

                      ///Current Password
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              controller: _currentPasswordController,
                              validator: RequiredValidator(
                                  errorText: AutofillHints.password),
                              obscureText: !_isVisible,
                              obscuringCharacter: "*",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                //eye icon (see password)
                                suffixIcon: Align(
                                  widthFactor: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: _isVisible
                                        ? Icon(
                                            Icons.visibility,
                                            color: MyPalette.darkTurqoise,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'Current Password',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 3),
                                ),
                                labelText: 'Please enter your current password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.03),

                      ///Enter new password
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              controller: _newPasswordController,
                              validator:
                                  RequiredValidator(errorText: "new password"),
                              obscureText: !_isVisible,
                              obscuringCharacter: "*",
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                //eye icon (see password)
                                suffixIcon: Align(
                                  widthFactor: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: _isVisible
                                        ? Icon(
                                            Icons.visibility,
                                            color: MyPalette.darkTurqoise,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'New Password',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 3),
                                ),
                                labelText: 'Please enter your new password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.03),

                      ///Confirm new password
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              controller: _newPasswordController2,
                              validator:
                                  RequiredValidator(errorText: "new email"),
                              obscureText: !_isVisible,
                              obscuringCharacter: "*",
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                //eye icon (see password)
                                suffixIcon: Align(
                                  widthFactor: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: _isVisible
                                        ? Icon(
                                            Icons.visibility,
                                            color: MyPalette.darkTurqoise,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'Confirm New Password',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 3),
                                ),
                                labelText: 'Please confirm your new password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.05),

                      ///Submit button
                      Container(
                        child: TextButton(
                          child: Container(
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
                            if (_formKey.currentState!.validate()) {
                              changePassword(context);
                            }
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
                            Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    child: TextButton(
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
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  OTPEmailPage(),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallScreen extends StatefulWidget {
  _SmallScreenState createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen> {
  //lets user see their password if they choose to
  bool _isVisible = false;

  final _formKey = GlobalKey<FormState>();

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
              image: AssetImage("assets/userPageLarge.png"), fit: BoxFit.cover),
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
                        const IconData(0xf05bc, fontFamily: 'MaterialIcons'),
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),

              Form(
                key: _formKey,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 0.12 * width, right: 0.12 * width),
                  child: Column(
                    children: [
                      ///Logo
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(
                            top: height * 0.01, bottom: height * 0.005),
                        child: Image.asset("assets/music_swing_logo_small.png",
                            scale: 2.3),
                      ),

                      ///Current Password
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              controller: _currentPasswordController,
                              validator: RequiredValidator(
                                  errorText: AutofillHints.password),
                              obscureText: !_isVisible,
                              obscuringCharacter: "*",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                //eye icon (see password)
                                suffixIcon: Align(
                                  widthFactor: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: _isVisible
                                        ? Icon(
                                            Icons.visibility,
                                            color: MyPalette.darkTurqoise,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: "Current Password",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 3),
                                ),
                                labelText: 'Please enter your current password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///spacer
                      SizedBox(height: height * 0.02),

                      ///New Password
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              controller: _newPasswordController,
                              validator:
                                  RequiredValidator(errorText: "new password"),
                              obscureText: !_isVisible,
                              obscuringCharacter: "*",
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                //eye icon (see password)
                                suffixIcon: Align(
                                  widthFactor: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: _isVisible
                                        ? Icon(
                                            Icons.visibility,
                                            color: MyPalette.darkTurqoise,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'New Password',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 3),
                                ),
                                labelText: 'Please enter your new password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///spacer
                      SizedBox(height: height * 0.02),

                      ///Confirm New Password
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              controller: _newPasswordController2,
                              validator: RequiredValidator(
                                  errorText: "confirm new password"),
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                //eye icon (see password)
                                suffixIcon: Align(
                                  widthFactor: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: _isVisible
                                        ? Icon(
                                            Icons.visibility,
                                            color: MyPalette.darkTurqoise,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'Confirm New Password',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 3),
                                ),
                                labelText: 'Please confirm your new Password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          )
                        ],
                      ),

                      ///spacer
                      SizedBox(height: height * 0.04),

                      ///Submit Button
                      Container(
                        child: TextButton(
                          child: Container(
                            padding: EdgeInsets.only(top: height * 0.02),
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
                            if (_formKey.currentState!.validate()) {
                              changePassword(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                          ),
                        ),
                      ),

                      ///Forgot Password
                      Container(
                        padding: EdgeInsets.only(top: 0.01 * height, bottom: 0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 0.01 * height),
                              child: TextButton(
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
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OTPEmailPage(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> changePassword(BuildContext context) async {
  AuthRouter().changePassword(
    _newPasswordController.text,
  );
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => HomePage(),
    ),
  );
}

class ChangePasswordPage extends StatelessWidget {
  Widget build(Object context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, body: Column(children: [Body()]));
  }
}
