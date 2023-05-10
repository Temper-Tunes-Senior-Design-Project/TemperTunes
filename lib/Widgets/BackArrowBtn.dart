import 'package:flutter/material.dart';

class BackArrowBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 5),
      child: IconButton(
        icon: Icon(
          const IconData(0xf05bc, fontFamily: 'MaterialIcons'),
          color: Colors.white,
          size: 40,
        ),

        ///two options for onpressed:
        ///1. pop
        ///2. pop and push placement. You push the homepage -> pop current page and push the homepage
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
