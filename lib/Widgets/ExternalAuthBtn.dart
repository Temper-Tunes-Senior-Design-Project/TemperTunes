import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';

class ExternalAuthBtn extends StatelessWidget {
  final Image img;
  final String toolTipText;
  final void Function()? onPressed;
  final BuildContext context;
  final String heroTag;
  const ExternalAuthBtn(
      {required this.context,
      required this.heroTag,
      required this.img,
      required this.onPressed,
      required this.toolTipText,
      super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(),
      child: FloatingActionButton(
        hoverColor: Color.fromARGB(255, 75, 79, 95),
        hoverElevation: height * 0.04,
        elevation: 0,
        heroTag: heroTag,
        tooltip: toolTipText,
        backgroundColor: MyPalette.white,
        onPressed: onPressed,
        child: Container(height: 42, child: img),
      ),
    );
  }
}
