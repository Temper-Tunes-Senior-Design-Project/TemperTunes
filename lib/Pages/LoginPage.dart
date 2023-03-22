import 'package:flutter/material.dart';
import '../Utilities/AuthRouter.dart';
import '../Widgets/widgets.dart';
import 'HomePage.dart';
import 'OTPEmailPage.dart';
import 'SignupPage.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
MultiValidator emailValidator = MultiValidator([
  /// RequiredValidator(errorText: "* Required"),
  //EmailValidator(errorText: "Enter valid email ID"),
]);

class LargeScreen extends StatefulWidget {
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  //lets user see their password if they choose to
  bool _isVisible = false;
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
        child: Padding(
          padding: EdgeInsets.only(top: 0.03 * height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                //back button
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          TextButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                            ),
                            child: Icon(
                              const IconData(0xf05bc,
                                  fontFamily: 'MaterialIcons'),
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
              FittedBox(
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
                        Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(top: height * 0.02),
                          child: Image.asset(
                              "assets/music_swing_logo_small.png",
                              scale: 2.5),
                        ),

                        ///User input area
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 0.02 * width, right: 0.02 * width),

                              ///TextFormField
                              child: TextFormField(
                                controller: _emailController,
                                validator: RequiredValidator(
                                    errorText: AutofillHints.email),
                                textAlign: TextAlign.left,
                                cursorColor: Colors.white,
                                style: TextStyle(
                                  fontFamily: 'Maven Pro',
                                  fontWeight: FontWeight.w100,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  //icon
                                  prefixIcon: Icon(
                                    const IconData(0xe491,
                                        fontFamily: 'MaterialIcons'),
                                    color: MyPalette.white,
                                    size: 34,
                                  ),
                                  hintStyle: TextStyle(color: Colors.white60),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 3),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: MyPalette.darkTurqoise,
                                        width: 3),
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
                        SizedBox(height: 0.025 * height),

                        ///password icon
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ///TextField
                            Container(
                              padding: EdgeInsets.only(
                                left: 0.02 * width,
                                right: 0.02 * width,
                              ),
                              //textformfield
                              child: TextFormField(
                                controller: _passwordController,
                                validator: RequiredValidator(
                                    errorText: AutofillHints.password),
                                textAlign: TextAlign.left,
                                obscureText: !_isVisible,
                                obscuringCharacter: "*",
                                cursorColor: Colors.white,
                                style: TextStyle(
                                  fontFamily: 'Maven Pro',
                                  fontWeight: FontWeight.w100,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  ///Eye icon (see password)
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

                                  ///PrefixIcon
                                  prefixIcon: Icon(
                                    const IconData(0xe3ae,
                                        fontFamily: 'MaterialIcons'),
                                    color: MyPalette.white,
                                    size: 34,
                                  ),
                                  hintStyle: TextStyle(color: Colors.white60),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 3),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: MyPalette.darkTurqoise,
                                        width: 3),
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
                        SizedBox(height: 0.03 * height),

                        ///Buttons
                        //Login button
                        Container(
                          padding: EdgeInsets.only(top: 0.016 * height),
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

                        ///Spacer
                        SizedBox(height: 0.05 * height),

                        ///Forgot Password
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
                                    builder: (context) => OTPEmailPage(),
                                  ),
                                );
                              }),
                        ),
                      ],
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
                              const IconData(0xf05bc,
                                  fontFamily: 'MaterialIcons'),
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
                            top: height * 0.01, bottom: height * 0.012),
                        child: Image.asset("assets/music_swing_logo_small.png",
                            scale: 2),
                      ),

                      ///User input area
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ///TextField
                          Container(
                            padding: EdgeInsets.only(
                              left: 0.10 * width,
                              right: 0.10 * width,
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              validator: RequiredValidator(
                                  errorText: AutofillHints.email),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Align(
                                  widthFactor: 0,
                                  heightFactor: 1.0,
                                  child: Icon(
                                    const IconData(0xe491,
                                        fontFamily: 'MaterialIcons'),
                                    color: MyPalette.white,
                                    size: 30,
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 4),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 4),
                                ),
                                labelText: 'Please enter your email',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                                //  errorText: _emailErrorText,
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///spacer
                      SizedBox(height: height * 0.03),

                      /// Password icon
                      Column(
                        children: [
                          //errorText getter
                          ///Text field
                          Container(
                            padding: EdgeInsets.only(
                                left: 0.1 * width, right: 0.1 * width),
                            child: TextFormField(
                              controller: _passwordController,
                              validator: RequiredValidator(
                                  errorText: AutofillHints.password),
                              obscureText: !_isVisible,
                              obscuringCharacter: "*",
                              textAlign: TextAlign.left,
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
                                prefixIcon: Align(
                                  widthFactor: 1.0,
                                  child: Icon(
                                    const IconData(0xe3ae,
                                        fontFamily: 'MaterialIcons'),
                                    color: MyPalette.white,
                                    size: 32,
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 4),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: MyPalette.darkTurqoise, width: 4),
                                ),
                                labelText: 'Please enter your password',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white54),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 0.06 * height),

                      ///Buttons
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

                      SizedBox(height: 0.005 * height),

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
  });
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
