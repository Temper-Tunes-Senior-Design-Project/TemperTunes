import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Widgets/widgets.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../Objects/Mood.dart';
import '../Utilities/APIRouter.dart';

class MoodPopup extends StatelessWidget {
  final String filePath;
  MoodPopup(this.filePath);
  late Future<Mood> emotion;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      child: Container(
        height: height * 0.3,
        width: width * 0.3,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [
          //     MyPalette.brightMagenta,
          //     MyPalette.turqoise,
          //   ],
          // ),

          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              color: MyPalette.brightMagenta,
              blurRadius: 16,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: FutureBuilder<Mood>(
          future: APIRouter().getUserMood(filePath),
          builder: (context, snapshot) {
            print("Rebuilding");
            if (snapshot.hasData) {
              Widget w = Container();

              ///For adding emotion icons
              switch (snapshot.data) {
                case Mood.Angry:
                  w = Image.asset("assets/emotions/angry.png");
                  break;
                case Mood.Disgust:
                  w = Image.asset("assets/emotions/disgust.png");
                  break;
                case Mood.Fear:
                  w = Image.asset("assets/emotions/fear.png");
                  break;
                case Mood.Happy:
                  w = Image.asset("assets/emotions/happy.png");
                  break;
                case Mood.Sad:
                  w = Image.asset("assets/emotions/sad.png");
                  break;
                case Mood.Surprise:
                  w = Image.asset("assets/emotions/surprise.png");
                  break;
                case Mood.Neutral:
                  w = Image.asset("assets/emotions/neutral.png");
                  break;
              }
              return Column(
                children: [
                  w,
                  Container(
                    child: Text(
                      snapshot.data?.name ?? "No data",
                      style: TextStyle(
                        fontFamily: 'Share Tech',
                        color: MyPalette.darkBlue,
                        fontSize: 30,
                      ),
                    ),
                  )
                ],
              );

              return Container(
                child: Text(
                  snapshot.data?.name ?? "No data",
                  style: TextStyle(
                    fontFamily: 'Share Tech',
                    color: MyPalette.darkBlue,
                    fontSize: 30,
                  ),
                ),
              );
            }
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 0.05 * height,
                    width: 0.05 * width,
                    child: WaveLoader(title: 'Wave'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Loading ...",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),

              // SpinKitWave(
              //   color: Colors.white,
              //   size: 50.0,
              // ),
            );
          },
        ),
      ),
    );
  }
}
