import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left:0.01*width, top: 0.06*height),
      child: Container(
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
              onPressed: () => Navigator.pop(context)
          ),
        ],
      ),
    ),
  );
  }

}