import 'package:flutter/material.dart';

class ImageHelper extends StatelessWidget
{
  final String url;
  final String text;
  ImageHelper(this.url, this.text);

  @override
  Widget build(BuildContext context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(child: Container( height: 75, width:75, child: Image.network(url))),
        Flexible(child: Text(text, textAlign: TextAlign.center,))
      ],
    );
  }
}