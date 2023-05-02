import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:animate_do/animate_do.dart';

import '../Widgets/widgets.dart';
import 'dart:async';

///from https://github.com/adar2378/pin_code_fields/blob/master/example/lib/main.dart

class VerificationLarge extends StatefulWidget {
  const VerificationLarge({
    Key? key,
    this.email,
  }) : super(key: key);

  final String? email;

  @override
  State<VerificationLarge> createState() => _VerificationLargeState();
}

class _VerificationLargeState extends State<VerificationLarge> {
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
                image: AssetImage("assets/userPageLarge.png"),
                fit: BoxFit.cover),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ///Back button
              BackArrowBtn(),

              ///Main Container
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FadeInUp(
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
                          ///logo
                          Container(
                            padding: EdgeInsets.only(top: 0.02 * height),
                            child: Image.asset(
                                "assets/music_swing_logo_small.png",
                                scale: 2.3),
                          ),

                          ///spacer
                          SizedBox(height: height * 0.02),

                          ///Heading
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0.01),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Verification',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  fontFamily: 'Share Tech',
                                  color: MyPalette.lightPurple,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                          ///subheading
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.01),
                            child: RichText(
                              //email
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
                                    color: Colors.white70,
                                    fontSize: 20,
                                    fontFamily: 'Maven Pro'),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          ///Spacer
                          SizedBox(height: height * 0.02),

                          ///form portion
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Form(
                                  key: formKey,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: height * 0.004,
                                      horizontal: width * 0.018,
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
                                        fieldHeight: 70,
                                        fieldWidth: 40,
                                        inactiveColor: MyPalette.magenta,
                                        inactiveFillColor:
                                            Color.fromARGB(255, 57, 48, 86),
                                        activeFillColor: MyPalette.darkTurqoise,
                                        selectedFillColor: MyPalette.magenta,
                                      ),
                                      cursorColor: Colors.black,
                                      animationDuration:
                                          const Duration(milliseconds: 300),
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

                                ///error message
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    hasError ? "*Incorrect pin" : "",
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),

                                ///spacer
                                SizedBox(height: 0.01 * height),

                                ///Snackbar message and resend button
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Didn't receive the code? ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: TextButton(
                                        onPressed: () =>
                                            snackBar("OTP resend!!"),
                                        child: Text(
                                          "RESEND",
                                          style: TextStyle(
                                            color: MyPalette.turqoise,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                ////spacer
                                SizedBox(
                                  height: 0.01 * height,
                                ),

                                ///Verifier
                                Container(
                                  height: height * 0.07,
                                  width: width * 0.19,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0.01 * height,
                                      horizontal: width * 0.01),
                                  child: ButtonTheme(
                                    height: height * 0.02,
                                    child: TextButton(
                                      onPressed: () {
                                        formKey.currentState!.validate();
                                        // conditions for validating
                                        if (currentText.length != 5 ||
                                            currentText != "12345") {
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
                                            fontSize: 25,
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
            ],
          ),
        ),
      ),
    );
  }
}
