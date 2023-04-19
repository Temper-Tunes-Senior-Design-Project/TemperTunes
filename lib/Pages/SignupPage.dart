import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/LoginPage.dart';
import 'package:mood_swing/Utilities/AuthRouter.dart';
import '../Objects/LoginCredentials.dart';
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
LoginCredentials? credential;

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
    return SafeArea(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/loginPageLarge.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BackArrowBtn(),

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
                child: Expanded(
                  child: Column(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          children: [
                            ///App logo
                            Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(top: height * 0.02),
                              child: Image.asset(
                                  "assets/music_swing_logo_small.png",
                                  scale: 2.5),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ///Username
                                ChangeForm(
                                  context: context,
                                  controller: _usernameController,
                                  validator: RequiredValidator(
                                      errorText: AutofillHints.username),
                                  label: 'Username',
                                ),

                                ///Email
                                ChangeForm(
                                  context: context,
                                  controller: _emailController,
                                  validator: RequiredValidator(
                                      errorText: AutofillHints.email),
                                  label: 'Email',
                                ),

                                ///Password
                                PasswordForm(
                                  context: context,
                                  controller: _passwordController,
                                  validator: RequiredValidator(
                                      errorText: AutofillHints.password),
                                  label: 'Password',
                                  obscuringChar: '*',
                                ),

                                ///Confirm Password
                                PasswordForm(
                                  context: context,
                                  controller: _passwordController2,
                                  validator: RequiredValidator(
                                      errorText: "confirm password"),
                                  label: 'Confirm Password',
                                  obscuringChar: '*',
                                ),
                              ],
                            ),

                            SizedBox(height: height * 0.023),

                            ///Register button
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
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
                            ),

                            Container(
                              padding: EdgeInsets.only(
                                  top: 0.01 * height, bottom: 0),
                              child: Column(
                                children: [
                                  ///Regular Text
                                  Text(
                                    'Have an account already?',
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
                    ],
                  ),
                ),
              ),
            ),
          ],
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
    return SafeArea(
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
                    ChangeForm(
                      context: context,
                      controller: _usernameController,
                      validator:
                          RequiredValidator(errorText: AutofillHints.username),
                      label: 'Username',
                    ),

                    SizedBox(height: height * 0.015),

                    ///Email
                    ChangeForm(
                      context: context,
                      controller: _emailController,
                      validator:
                          RequiredValidator(errorText: AutofillHints.email),
                      label: 'Email',
                    ),

                    SizedBox(height: height * 0.015),

                    ///Password
                    PasswordForm(
                      context: context,
                      controller: _passwordController,
                      validator:
                          RequiredValidator(errorText: AutofillHints.password),
                      label: 'Password',
                      obscuringChar: '*',
                    ),

                    SizedBox(height: height * 0.015),

                    ///Confirm Password
                    PasswordForm(
                      context: context,
                      controller: _passwordController2,
                      validator:
                          RequiredValidator(errorText: "confirm password"),
                      label: 'Confirm Password',
                      obscuringChar: '*',
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
                            'Have an account already?',
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
    );
  }
}

Future<void> register(BuildContext context) async {
  credential ??= await AuthRouter().registerUser(
      _emailController.text, _passwordController.text, _usernameController.text,
      () {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Invalid credentials'),
      ),
    );
  });
  if (credential != null) {
    AuthRouter().credentialSignIn(credential!, context);
  }
}

class SignupPage extends StatelessWidget {
  SignupPage({super.key, LoginCredentials? authCred}) {
    credential = authCred;
  }

  @override
  Widget build(Object context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: Body());
  }
}
