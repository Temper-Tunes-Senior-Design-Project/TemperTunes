import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Widgets/widgets.dart';
import 'dart:async';

///from https://github.com/adar2378/pin_code_fields/blob/master/example/lib/main.dart

class VerificationSmall extends StatefulWidget {
  const VerificationSmall({
    Key? key,
    this.email,
  }) : super(key: key);

  final String? email;

  @override
  State<VerificationSmall> createState() => _VerificationSmallState();
}

class _VerificationSmallState extends State<VerificationSmall> {
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
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/loginPageSmall.png"),
                fit: BoxFit.cover),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ///Back button
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

              /// Logo
              SizedBox(
                height: height * 0.23,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("assets/music_swing_logo_small.png"),
                ),
              ),

              ///spacer
              SizedBox(height: height * 0.02),

              ///Heading
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.01),
                child: Text(
                  'Verification',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      fontFamily: 'Share Tech',
                      color: MyPalette.lightPurple),
                  textAlign: TextAlign.center,
                ),
              ),

              ///subheading
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.01),
                child: RichText(
                  //phone number
                  text: TextSpan(
                    text: "Pin sent to ",
                    children: [
                      TextSpan(
                        text: "${widget.email}",
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
                height: 0.02 * height,
              ),

              Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.01 * height,
                    horizontal: 0.08 * width,
                  ),
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: MyPalette.turqoise,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 5,
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
                      fieldHeight: height * 0.12,
                      fieldWidth: width * 0.1,
                      inactiveColor: MyPalette.magenta,
                      inactiveFillColor: MyPalette.slateBlue,
                      activeFillColor: MyPalette.darkTurqoise,
                      selectedFillColor: MyPalette.magenta,
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
                height: 0.01 * height,
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
                height: 0.001 * height,
              ),

              ///Verifier
              Container(
                height: 0.07 * height,
                // width: 0.02 * width,
                margin: EdgeInsets.symmetric(
                    vertical: 0.01 * height, horizontal: 0.15 * width),
                child: ButtonTheme(
                  height: 0.02 * height,
                  child: TextButton(
                    onPressed: () {
                      formKey.currentState!.validate();
                      // conditions for validating
                      if (currentText.length != 5 || currentText != "12345") {
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
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
