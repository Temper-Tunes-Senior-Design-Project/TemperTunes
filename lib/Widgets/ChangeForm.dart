import '../Widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChangeForm extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final String label;
  final BuildContext context;
  const ChangeForm(
      {required this.controller,
      required this.validator,
      required this.context,
      required this.label,
      super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: height * 0.005),
      child: TextFormField(
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
      ),
    );
  }
}
