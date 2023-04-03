import 'package:easy_stepper/easy_stepper.dart';

import 'MyPalette.dart';

class PreferenceOption extends StatelessWidget
{
  final String text;
  final double height;
  final double width;
  final IconData icon;
  final void Function() onPressed;

  PreferenceOption(this.text, this.height,this.width,this.icon, this.onPressed);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.only(top: 0.035 * height),
      child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    icon,
                    color: MyPalette.white,
                    size: 24,
                  )),

              ///Name
              Container(
                padding: EdgeInsets.only(left: 0.01 * width),
                alignment: Alignment.topLeft,
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Maven Pro',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          onPressed: onPressed,
          ),
    );
  }
}