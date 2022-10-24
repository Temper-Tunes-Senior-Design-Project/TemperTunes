import 'package:flutter/material.dart';

class GridText extends StatelessWidget
{
  final String number;
  final String text;
  GridText(this.number, this.text);

  Widget build(BuildContext context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Spacer(),
        Flexible(child: Text(number, maxLines: 2, textAlign: TextAlign.center,)),
        Flexible(child: Text(text, textAlign: TextAlign.center,))
      ],
    );
  }
}