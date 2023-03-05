import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/HomePage.dart';
import 'package:mood_swing/Pages/LoginPage.dart';
import 'package:mood_swing/Utilities/AuthRouter.dart';
import 'package:mood_swing/Utilities/DatabaseRouter.dart';
import '../Widgets/widgets.dart';
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

TextEditingController _emailController = new TextEditingController();
TextEditingController _usernameController = new TextEditingController();
TextEditingController _passwordController = new TextEditingController();
TextEditingController _passwordController2 = new TextEditingController();

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
                            scale: 2.5),
                      ),

                      ///Username
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              controller: _usernameController,
                              validator: RequiredValidator(
                                  errorText: AutofillHints.username),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'Username',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 3),
                                ),
                                labelText: 'Please enter your username',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///Enter Email
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: height * 0.005),
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              controller: _emailController,
                              validator: RequiredValidator(
                                  errorText: AutofillHints.email),
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'Email',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 3),
                                ),
                                labelText: 'Please enter your email',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///Password
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: height * 0.005),
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              controller: _passwordController,
                              validator: RequiredValidator(
                                  errorText: AutofillHints.password),
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
                                hintText: 'Password',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 3),
                                ),
                                labelText: 'Please enter your password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///Confirm Password
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: height * 0.005),
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              controller: _passwordController2,
                              validator: RequiredValidator(
                                  errorText: AutofillHints.password),
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
                                hintText: 'Confirm Password',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 3),
                                ),
                                labelText: 'Please confirm your password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.023),

                      ///Register button
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
                            if (_formKey.currentState!.validate()) {
                              register(context);
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
                                          builder: (context) => LoginPage(),
                                        ),
                                      );
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
                            scale: 2.5),
                      ),

                      ///Username
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              controller: _usernameController,
                              validator: RequiredValidator(
                                  errorText: AutofillHints.username),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: "Username",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 3),
                                ),
                                labelText: 'Please enter your username',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///spacer
                      SizedBox(height: height * 0.015),

                      ///Email
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              controller: _emailController,
                              validator: RequiredValidator(
                                  errorText: AutofillHints.email),
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                                hintText: 'Email',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 3),
                                ),
                                labelText: 'Please enter your email',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///spacer
                      SizedBox(height: height * 0.015),

                      ///Password
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              controller: _passwordController,
                              validator: RequiredValidator(
                                  errorText: AutofillHints.password),
                              obscureText: !_isVisible,
                              obscuringCharacter: "*",
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                //Eye icon (see password)
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
                                hintText: 'Password',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 3),
                                ),
                                labelText: 'Please enter your password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///spacer
                      SizedBox(height: height * 0.015),

                      ///Confirm Password
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                              controller: _passwordController2,
                              validator: RequiredValidator(
                                  errorText: AutofillHints.password),
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
                                hintText: 'Confirm Password',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 3),
                                ),
                                labelText: 'Please confirm your password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///spacer
                      SizedBox(height: height * 0.02),

                      ///Register Button
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
                            if (_formKey.currentState!.validate()) {
                              register(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                          ),
                        ),
                      ),

                      ///Already Have an account
                      Container(
                        padding: EdgeInsets.only(top: 0.01 * height, bottom: 0),
                        child: Column(
                          children: [
                            ///Regular Text
                            Text(
                              'Forgot your password?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),

                            ///Linked text to login
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(top: 0),
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
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                },
                              ),
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

Future<void> register(BuildContext context) async {
  await AuthRouter().registerUser(
      _emailController.text, _passwordController.text, _usernameController.text,
      () {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Invalid credentials'),
      ),
    );
  });
  DatabaseRouter().createUser(_usernameController.text);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => HomePage(),
    ),
  );
}

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [Body()],
      ),
    );
  }
}
