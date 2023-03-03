import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
///import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import '../Widgets/widgets.dart';
import 'dart:async';


//from https://github.com/adar2378/pin_code_fields/blob/master/example/lib/main.dart




class VerificationPage extends StatefulWidget {
  const VerificationPage({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  final String? phoneNumber;

  @override
  State<VerificationPage> createState() =>
      _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  late final StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

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
    return Scaffold(
      body: GestureDetector(
        onTap: () {},
        child: Container(
          height: height,
          width: width,
          decoration:BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/loginPageLarge.png"), fit: BoxFit.cover),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ///Back button
              Container(
                padding: EdgeInsets.only(left:0.01*width, top: 0.06*height),
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
                        onPressed: () => Navigator.pop(context)
                    ),
                  ],
                ),
              ),
              /// icon
              SizedBox(
                height: height*0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("assets/music_swing_logo_small.png"),
                ),
              ),
              ///spacer
              SizedBox(height: height*0.02),

              ///Heading
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.01),
                child: Text(
                  'Verification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35,
                      fontFamily: 'Share Tech', color: MyPalette.lightPurple),
                  textAlign: TextAlign.center,
                ),
              ),

              ///subheading
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.01),
                child: RichText(
                  //phone number
                  text: TextSpan(
                    text: "Pin sent to ",
                    children: [
                      TextSpan(
                        text: "${widget.phoneNumber}",
                        style: const TextStyle(
                          color: MyPalette.darkTurqoise,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Maven Pro',
                        ),
                      ),
                    ],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Maven Pro',
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              ///Spacer
              SizedBox(
                height: 0.02*height,
              ),

              Form(
                key: formKey,
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                    vertical: 0.01*height,
                    horizontal: 0.05*width,
                  ),
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 4,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 3) {
                        return "I'm from validator";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: MyPalette.brightMagenta,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: MyPalette.brightMagenta,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*Please fill up all the cells properly" : "",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 0.01*height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () => snackBar("OTP resend!!"),
                    child: const Text(
                      "RESEND",
                      style: TextStyle(
                        color: MyPalette.turqoise,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.001*height,
              ),

              ///Verifier
              Container(
                margin:
                EdgeInsets.symmetric(vertical: 0.001*height, horizontal: 30),
                child: ButtonTheme(
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      formKey.currentState!.validate();
                      // conditions for validating
                      if (currentText.length != 6 || currentText != "123456") {
                        errorController!.add(ErrorAnimationType
                            .shake); // Triggering error shake animation
                        setState(() => hasError = true);
                      } else {
                        setState(
                              () {
                            hasError = false;
                            snackBar("OTP Verified!!");
                          },
                        );
                      }
                    },
                    child: Center(
                      child: Text(
                        "VERIFY".toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
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
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: MyPalette.magenta,
                          offset: const Offset(1, -2),
                          blurRadius: 5),
                      BoxShadow(
                          color: MyPalette.magenta,
                          offset: const Offset(-1, 2),
                          blurRadius: 5)
                    ]),
              ),
              const SizedBox(
                height: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




/*

class VerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: VerifPage(),
    );
  }
}

class VerifPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerifPage> {
  TextEditingController newTextEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    newTextEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: height,
            width: width,
            child: Container(
              decoration:BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/userPageSmall.png"), fit: BoxFit.cover),
              ),
              child: Padding(
                padding: EdgeInsets.only(left:0.01*width, top: 0.06*height),
                child: Container(
                  child: Column(
                    children: [
                      ///back button
                      Row(
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
                          onPressed: () => Navigator.pop(context)
                      ),
                    ],
                  ),

                      Column(
                          children: <Widget>[

                            ///Title
                            Container(
                              padding: EdgeInsets.only(top: height*0.01, bottom:height*0.03),
                              child: Text(
                                'Verification Code',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: MyPalette.lightPurple,
                                    fontFamily: 'Share Tech'
                                ),
                              ),
                            ),

                            ///subtitle
                            Container(
                              child: Text('We have sent a code to @jdoe@gmail.com',
                                style: TextStyle( fontFamily: 'Maven Pro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white),
                              ),
                            ),

                            SizedBox(
                              height: 0.03*height,
                            ),
                            PinCodeFields(
                              length: 4,
                              padding: EdgeInsets.all(8),
                              fieldBorderStyle: FieldBorderStyle.square,
                              responsive: true,
                              fieldHeight: 0.15*height,
                              fieldWidth: 0.15*width,
                              borderWidth: 3.0,
                              activeBorderColor: MyPalette.darkMagenta,
                              activeBackgroundColor: MyPalette.brightMagenta,
                              borderRadius: BorderRadius.circular(15.0),
                              keyboardType: TextInputType.number,
                              autoHideKeyboard: false,
                              fieldBackgroundColor: MyPalette.slateBlue,
                              borderColor: MyPalette.hanPurple,
                              textStyle: TextStyle(
                                fontSize: 30.0,
                                color: MyPalette.dark,
                                fontWeight: FontWeight.bold,
                              ),
                              animationDuration: const Duration(milliseconds: 200),
                              animationCurve: Curves.easeInOut,
                              switchInAnimationCurve: Curves.easeIn,
                              switchOutAnimationCurve: Curves.easeOut,
                              animation: Animations.slideInDown,
                              onComplete: (output) {
                                // Your logic with pin code
                                print(output);
                              },
                            ),

                            ///spacer
                            SizedBox(
                              height: 0.035*height,
                            ),

                            ///button
                            Container(
                              //padding: EdgeInsets.only(top: height*0.03),
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

                            ///Resend code
                            Container(
                              padding: EdgeInsets.only(top: 0.03* height),
                              child: Text(
                                'Resend code',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Maven Pro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: MyPalette.turqoise,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ],
        ),
    );
  }
}*/

