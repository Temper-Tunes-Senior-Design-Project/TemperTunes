import '../Pages/OTPEmailPage.dart';
import '../Widgets/widgets.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
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
        style: ElevatedButton.styleFrom(
          // backgroundColor: MyPalette.dark.withOpacity(0.3),
          backgroundColor: MyPalette.dark.withOpacity(0.6),
          foregroundColor: MyPalette.brightMagenta.withOpacity(0.7),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPEmailPage(),
            ),
          );
        });
  }
}
