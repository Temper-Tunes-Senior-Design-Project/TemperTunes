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
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
