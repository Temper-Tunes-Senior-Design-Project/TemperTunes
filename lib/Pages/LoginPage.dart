import 'package:flutter/material.dart';
import '../Utilities/AuthRouter.dart';
import '../Widgets/widgets.dart';
import 'OTPEmailPage.dart';
import 'HomePage.dart';
import 'package:form_field_validator/form_field_validator.dart' as validator;
import 'package:bouncing_widget/bouncing_widget.dart';

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
// MultiValidator emailValidator = MultiValidator([
//   //   RequiredValidator(errorText: "* Required"),
//   //   EmailValidator(errorText: "Enter valid email ID"),
// ]);

class LargeScreen extends StatefulWidget {
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  //lets user see their password if they choose to
  bool _isVisible = false;
  final _formKey = GlobalKey<FormState>();
  double _scaleFactor = 1.5;

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
          padding: EdgeInsets.only(top: 0.03 * height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ///Back button
              BackArrowBtn(),

              ///Main Container
              Form(
                key: _formKey,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: height * 0.85,
                    minHeight: height * 0.8,
                    minWidth: width * 0.3,
                    maxWidth: width * 0.3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(top: height * 0.02),
                        child: Image.asset("assets/music_swing_logo_small.png",
                            scale: 2.4),
                      ),

                      ///User input area
                      Container(
                        padding: EdgeInsets.only(
                            left: 0.02 * width, right: 0.02 * width),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ///login
                            LoginEmailForm(
                              context: context,
                              controller: _emailController,
                              validator: validator.RequiredValidator(
                                  errorText: AutofillHints.email),
                              icon: Icons.email,
                              label: 'Please enter your email',
                            ),

                            ///spacer
                            SizedBox(height: 0.04 * height),

                            ///password
                            LoginPasswordForm(
                              context: context,
                              validator: validator.RequiredValidator(
                                  errorText: AutofillHints.password),
                              controller: _passwordController,
                              obscuringChar: "*",
                              icon: Icons.key,
                              label: "Please enter your password",
                            ),
                          ],
                        ),
                      ),

                      ///spacer
                      SizedBox(height: 0.02 * height),

                      ///Forgot Password
                      ForgotPassword(),

                      ///spacer
                      SizedBox(height: 0.04 * height),

                      ///Buttons
                      //Login button
                      BouncingWidget(
                        scaleFactor: _scaleFactor,
                        onPressed: () {},
                        child: Container(
                          child: TextButton(
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
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                login(context);
                              }
                            },
                          ),
                        ),
                      ),

                      ///Spacer
                      SizedBox(height: 0.04 * height),

                      ///Log in with
                      Container(
                        child: FittedBox(
                          child: Text(
                            'Or',
                            style: TextStyle(
                              color: white,
                              fontSize: 13,
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      ///Other account options
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        height: height * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ExternalAuthBtn(
                              context: context,
                              heroTag: "Google",
                              toolTipText: "Google",
                              img: Image.asset("assets/googleIcon.png",
                                  height: 15),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              },
                            ),
                            ExternalAuthBtn(
                              context: context,
                              heroTag: "Facebook",
                              toolTipText: "Facebook",
                              img: Image.asset("assets/facebookIcon.png"),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              },
                            ),
                            ExternalAuthBtn(
                              context: context,
                              img: Image.asset("assets/appleIcon.png"),
                              toolTipText: "AppleID",
                              heroTag: "Apple Login",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
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
      child: SafeArea(
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
              ///Back button
              BackArrowBtn(),

              ///Main Container
              Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    children: [
                      ///Logo
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(
                            top: height * 0.01, bottom: height * 0.01),
                        child: Image.asset("assets/music_swing_logo_small.png",
                            scale: 2.5),
                      ),

                      ///input area
                      Container(
                        padding: EdgeInsets.only(
                            left: 0.1 * width, right: 0.1 * width),
                        child: Column(
                          children: [
                            ///email
                            LoginEmailForm(
                              context: context,
                              controller: _emailController,
                              validator: validator.RequiredValidator(
                                  errorText: AutofillHints.email),
                              icon: Icons.email,
                              label: 'Please enter your email',
                            ),
                            SizedBox(height: 0.04 * height),

                            ///password
                            LoginPasswordForm(
                              context: context,
                              validator: validator.RequiredValidator(
                                  errorText: AutofillHints.password),
                              controller: _passwordController,
                              obscuringChar: "*",
                              icon: Icons.key,
                              label: "Please enter your password",
                            ),
                            SizedBox(height: 0.02 * height),
                          ],
                        ),
                      ),

                      ForgotPassword(),

                      SizedBox(height: 0.04 * height),

                      ///Button
                      //Login Button
                      Container(
                        //padding: EdgeInsets.only(top: height*0.03),
                        child: TextButton(
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              login(context);
                            }
                          },
                        ),
                      ),

                      SizedBox(height: 0.02 * height),

                      ///Log in with
                      Container(
                        child: FittedBox(
                          child: Text(
                            'Or',
                            style: TextStyle(
                              color: white,
                              fontSize: 14,
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      ///Other account options
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        height: height * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: ExternalAuthBtn(
                                context: context,
                                heroTag: "Google",
                                toolTipText: "Google",
                                img: Image.asset("assets/googleIcon.png"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: ExternalAuthBtn(
                                context: context,
                                heroTag: "Facebook",
                                toolTipText: "Facebook",
                                img: Image.asset("assets/facebookIcon.png"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: ExternalAuthBtn(
                                context: context,
                                img: Image.asset("assets/appleIcon.png"),
                                toolTipText: "AppleID",
                                heroTag: "Apple Login",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void login(BuildContext context) async {
  AuthRouter().login(_emailController.text, _passwordController.text, () {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Invalid credentials'),
      ),
    );
  }, context);
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(Object context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}

class LoginEmailForm extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final IconData icon;
  final String label;
  final BuildContext context;
  const LoginEmailForm(
      {required this.controller,
      required this.validator,
      required this.context,
      required this.icon,
      required this.label,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textAlign: TextAlign.left,
      cursorColor: Colors.white,
      style: TextStyle(
        fontFamily: 'Maven Pro',
        fontWeight: FontWeight.w100,
        color: Colors.white,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white, size: 34),
        hintStyle: TextStyle(color: Colors.white60),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: new BorderSide(color: MyPalette.darkTurqoise, width: 3),
        ),
        labelText: label,
        labelStyle: TextStyle(fontSize: 15, color: Colors.white54),
      ),
    );
  }
}

class LoginPasswordForm extends StatefulWidget {
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final String obscuringChar;
  final IconData icon;
  final String label;
  final BuildContext context;

  const LoginPasswordForm(
      {required this.controller,
      required this.validator,
      required this.context,
      required this.icon,
      required this.label,
      required this.obscuringChar,
      super.key});

  @override
  _LoginPasswordFormState createState() => _LoginPasswordFormState();
}

class _LoginPasswordFormState extends State<LoginPasswordForm> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      textAlign: TextAlign.left,
      cursorColor: Colors.white,
      style: TextStyle(
        fontFamily: 'Maven Pro',
        fontWeight: FontWeight.w100,
        color: Colors.white,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        suffixIcon: Align(
          widthFactor: 0,
          child: IconButton(
            onPressed: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
            icon: _isVisible
                ? Icon(Icons.visibility, color: MyPalette.darkTurqoise)
                : Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  ),
          ),
        ),
        prefixIcon: Align(
          widthFactor: 1.0,
          child: Icon(widget.icon, color: Colors.white, size: 34),
        ),
        hintStyle: TextStyle(color: Colors.white60),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: new BorderSide(color: MyPalette.darkTurqoise, width: 3),
        ),
        labelText: widget.label,
        labelStyle: TextStyle(fontSize: 15, color: Colors.white54),
      ),
    );
  }
}
