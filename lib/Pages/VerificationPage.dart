import 'package:flutter/material.dart';

///import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import '../Widgets/widgets.dart';
//import 'dart:async';

///from https://github.com/adar2378/pin_code_fields/blob/master/example/lib/main.dart

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}

class LargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerificationLarge(
      email: "jdoe@gmail.com",
    );
  }
}

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerificationSmall(
      email: "jdoe@gmail.com",
    );
  }
}

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              child: Body(),
            ),
          ],
        ),
      ),
    );
  }
}
