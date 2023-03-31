import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ClassPopup {
  AwesomeDialog getDialogue(context) {
    return AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      body: Center(
        child: Text(
          'If the body is specified, then title and description will be ignored, this allows to further customize the dialogue.',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      title: 'This is Ignored',
      desc: 'This is also Ignored',
      btnOkOnPress: () {},
    );
  }
}
