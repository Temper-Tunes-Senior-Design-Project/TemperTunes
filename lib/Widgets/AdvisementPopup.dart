import 'package:flutter/material.dart';
import 'MyPalette.dart';

class AdvisementPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Alert", style: TextStyle(color: Colors.white, fontSize: 30)),
      backgroundColor: MyPalette.brightMagenta,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      content: SizedBox(
        height: 150,
        width: 400,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                  "The application is currently in the pre-release stage, if you do not have approval of the developers, you will be unable to link your spotify account",
                  style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center, ),
              SizedBox(height: 20,),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "I understand",
                  style: TextStyle(
                    color: MyPalette.turqoise,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
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
