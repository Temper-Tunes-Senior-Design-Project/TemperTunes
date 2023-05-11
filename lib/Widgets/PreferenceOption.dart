import 'package:easy_stepper/easy_stepper.dart';

import 'MyPalette.dart';

class PreferenceOption extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final double fontSize;
  final Icon icon;
  final void Function() onPressed;

  PreferenceOption(this.text, this.height, this.width, this.icon,
      this.onPressed, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0.02 * height),
      alignment: Alignment.topCenter,
      child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: MyPalette.brightMagenta,
          ),
          icon: icon,
          label: FittedBox(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Maven Pro',
                color: Colors.white,
                fontSize: fontSize,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
    );
  }
}
