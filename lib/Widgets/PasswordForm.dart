import '../Widgets/widgets.dart';
import 'package:flutter/material.dart';

class PasswordForm extends StatefulWidget {
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final String obscuringChar;
  final String label;
  final BuildContext context;
  const PasswordForm(
      {required this.controller,
      required this.validator,
      required this.context,
      required this.label,
      required this.obscuringChar,
      super.key});

  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
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
