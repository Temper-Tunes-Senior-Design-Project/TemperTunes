//CHANGE PASSWORD

import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';
import 'package:mood_swing/Pages/HomePage.dart';
import 'package:form_field_validator/form_field_validator.dart' as validator;
import 'package:mood_swing/Utilities/AuthRouter.dart';
import 'package:animate_do/animate_do.dart';

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
  // bool _isVisible = false;

  final _formKey = GlobalKey<FormState>();

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

        ///back arrow
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

                      ///Current password
                      ChangeForm(
                        context: context,
                        controller: _currentPasswordController,
                        validator: validator.RequiredValidator(
                          errorText: AutofillHints.password,
                        ),
                        label: 'Current Password',
                      ),

                      ///New Password
                      ChangeForm(
                        context: context,
                        controller: _newPasswordController,
                        validator: validator.RequiredValidator(
                          errorText: AutofillHints.newPassword,
                        ),
                        label: 'New Password',
                      ),

                      ///Confirm new password
                      ChangeForm(
                        context: context,
                        controller: _newPasswordController2,
                        validator: validator.RequiredValidator(
                          errorText: "confirm password",
                        ),
                        label: 'Confirm Password',
                      ),

                      ///Submit button
                      Container(
                        child: TextButton(
                          child: Container(
                            padding: EdgeInsets.only(top: height * 0.02),
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
                      ForgotPassword(),
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
  // bool _isVisible = false;

  final _formKey = GlobalKey<FormState>();

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
                image: AssetImage("assets/userPageLarge.png"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 0.01 * height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ///back button
                BackArrowBtn(),

                FadeInDown(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 0.12 * width, right: 0.12 * width),
                      child: Column(
                        children: [
                          ///Logo
                          Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(
                                top: height * 0.01, bottom: height * 0.005),
                            child: Image.asset(
                                "assets/music_swing_logo_small.png",
                                scale: 2.3),
                          ),

                          ///Current password
                          ChangeForm(
                            context: context,
                            controller: _currentPasswordController,
                            validator: validator.RequiredValidator(
                              errorText: AutofillHints.password,
                            ),
                            label: 'Current Password',
                          ),

                          ///spacer
                          SizedBox(height: height * 0.02),

                          ///New Password
                          ChangeForm(
                            context: context,
                            controller: _newPasswordController,
                            validator: validator.RequiredValidator(
                              errorText: AutofillHints.newPassword,
                            ),
                            label: 'New Password',
                          ),

                          ///spacer
                          SizedBox(height: height * 0.02),

                          ///Confirm new password
                          ChangeForm(
                            context: context,
                            controller: _newPasswordController2,
                            validator: validator.RequiredValidator(
                              errorText: "confirm password",
                            ),
                            label: 'Confirm Password',
                          ),

                          SizedBox(height: height * 0.04),

                          ///Submit Button
                          Container(
                            child: TextButton(
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

                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  changePassword(context);
                                }
                              },

                              // onPressed: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => HomePage(),
                              //     ),
                              //   );
                              // },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.transparent,
                              ),
                            ),
                          ),

                          ///spacer
                          SizedBox(height: 0.02 * height),

                          ///Forgot Password
                          ForgotPassword(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
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
