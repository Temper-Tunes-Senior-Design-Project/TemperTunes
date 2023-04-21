//CHANGE EMAIL

import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';
import 'package:mood_swing/Pages/HomePage.dart';
import 'package:mood_swing/Utilities/AuthRouter.dart';
import 'package:form_field_validator/form_field_validator.dart' as validator;
import 'dart:async';
import 'package:animate_do/animate_do.dart';

import 'OTPEmailPage.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}

TextEditingController _currentEmailController = new TextEditingController();
TextEditingController _newEmailController = new TextEditingController();
TextEditingController _newEmailController2 = new TextEditingController();
TextEditingController _passwordController = new TextEditingController();

class LargeScreen extends StatefulWidget {
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  final _formKey = GlobalKey<FormState>();
  //show password
  bool _isVisible = false;

  // snackBar Widget

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BackArrowBtn(),

              ///Main Container
              FadeInDown(
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: height * 0.8,
                    width: width * 0.3,
                    padding: EdgeInsets.only(
                        left: 0.03 * width, right: 0.03 * height),
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
                            flex: 1,
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

                                ///Forms
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ///current email
                                    ChangeForm(
                                      context: context,
                                      controller: _currentEmailController,
                                      validator: validator.RequiredValidator(
                                        errorText: AutofillHints.email,
                                      ),
                                      label: 'Current Email',
                                    ),

                                    ///new email
                                    ChangeForm(
                                      context: context,
                                      controller: _newEmailController,
                                      validator: validator.RequiredValidator(
                                        errorText: "new email",
                                      ),
                                      label: 'New Email',
                                    ),

                                    ///confirm new email
                                    ChangeForm(
                                      context: context,
                                      controller: _newEmailController2,
                                      validator: validator.RequiredValidator(
                                        errorText: "confirm new email",
                                      ),
                                      label: 'Confirm New Email',
                                    ),

                                    ///password
                                    PasswordForm(
                                      context: context,
                                      validator: validator.RequiredValidator(
                                          errorText: AutofillHints.password),
                                      controller: _passwordController,
                                      obscuringChar: "*",
                                      label: "Please enter your password",
                                    ),
                                  ],
                                ),

                                SizedBox(height: height * 0.03),

                                ///Submit button
                                Container(
                                  child: TextButton(
                                    child: Container(
                                      width: 0.2 * width,
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
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        changeEmail(context);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Colors.transparent,
                                    ),
                                  ),
                                ),

                                SizedBox(height: height * 0.005),

                                ///Forgot Password
                                ForgotPassword(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
    return SafeArea(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          //set img to bg of body
          image: DecorationImage(
              image: AssetImage("assets/ribbon_bottom.png"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ///back button
            BackArrowBtn(),

            FadeInDown(
              child: Form(
                key: _formKey,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 0.12 * width, right: 0.12 * width),
                  child: Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        ///Logo
                        Container(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                              "assets/music_swing_logo_small.png",
                              scale: 2.5),
                        ),

                        ///Forms
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ///current email
                            ChangeForm(
                              context: context,
                              controller: _currentEmailController,
                              validator: validator.RequiredValidator(
                                errorText: AutofillHints.email,
                              ),
                              label: 'Current Email',
                            ),

                            ///new email
                            ChangeForm(
                              context: context,
                              controller: _newEmailController,
                              validator: validator.RequiredValidator(
                                errorText: "new email",
                              ),
                              label: 'New Email',
                            ),

                            ///confirm new email
                            ChangeForm(
                              context: context,
                              controller: _newEmailController2,
                              validator: validator.RequiredValidator(
                                errorText: "confirm new email",
                              ),
                              label: 'Confirm New Email',
                            ),

                            ///password
                            PasswordForm(
                              context: context,
                              validator: validator.RequiredValidator(
                                  errorText: AutofillHints.password),
                              controller: _passwordController,
                              obscuringChar: "*",
                              label: "Please enter your password",
                            ),
                          ],
                        ),

                        ///spacer
                        SizedBox(height: height * 0.015),

                        ///Submit Button
                        Container(
                          child: TextButton(
                            child: Container(
                              padding: EdgeInsets.only(top: height * 0.015),
                              child: Container(
                                width: 0.4 * width,
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                changeEmail(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.transparent,
                            ),
                          ),
                        ),

                        SizedBox(height: 0.01 * height),

                        ///Forgot password
                        ForgotPassword(),
                      ],
                    ),
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

Future<void> changeEmail(BuildContext context) async {
  AuthRouter().changeEmail(
    _newEmailController.text,
  );
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => HomePage(),
    ),
  );
}

class ChangeEmailPage extends StatelessWidget {
  Widget build(Object context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, body: Column(children: [Body()]));
  }
}
