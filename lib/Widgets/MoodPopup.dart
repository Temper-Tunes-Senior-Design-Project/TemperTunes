import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';

import '../Objects/Mood.dart';
import '../Utilities/APIRouter.dart';

class MoodPopup extends StatelessWidget {
  final String filePath;
  MoodPopup(this.filePath);
  late final Future<Mood> emotion;

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
          color: Colors.white,
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
              switch (snapshot.data!) {
                case Mood.Angry:
                  w = Image.asset("assets/presets/angry.png",
                      height: 0.12 * height);
                  break;
                case Mood.Calm:
                  w = Image.asset("assets/presets/calm.png",
                      height: 0.12 * height);
                  break;
                case Mood.Content:
                  w = Image.asset("assets/presets/content.png",
                      height: 0.12 * height);
                  break;
                case Mood.Depressed:
                  w = Image.asset("assets/presets/depressed.png",
                      height: 0.12 * height);
                  break;
                case Mood.Energetic:
                  w = Image.asset("assets/presets/energetic.png",
                      height: 0.12 * height);
                  break;
                case Mood.Excited:
                  w = Image.asset("assets/presets/excited.png",
                      height: 0.12 * height);
                  break;
                case Mood.Happy:
                  w = Image.asset("assets/presets/happy.png",
                      height: 0.12 * height);
                  break;
                case Mood.Sad:
                  w = Image.asset("assets/presets/sad.png",
                      height: 0.12 * height);
                  break;
                default:
                  w = Text("ERROR - emotion could not be identified");
                  break;
              }

              ///For adding emotion icons
              // switch (snapshot.data!) {
              //   case Mood.Angry:
              //     w = Image.asset("assets/angry.png", height: 0.12 * height);
              //     break;
              //   case Mood.Disgust:
              //     w = Image.asset("assets/disgust.png", height: 0.12 * height);
              //     break;
              //   case Mood.Fear:
              //     w = Image.asset("assets/fear.png", height: 0.12 * height);
              //     break;
              //   case Mood.Happy:
              //     w = Image.asset("assets/happy.png", height: 0.12 * height);
              //     break;
              //   case Mood.Sad:
              //     w = Image.asset("assets/sad.png", height: 0.12 * height);
              //     break;
              //   case Mood.Surprise:
              //     w = Image.asset("assets/surprise.png", height: 0.12 * height);
              //     break;
              //   case Mood.Neutral :
              //     // w = Image.asset("assets/emotions/neutral.png");
              //     w = Image.asset("assets/neutral.png", height: 0.12 * height);
              //     break;
              // }
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          snapshot.data?.name ?? "No data",
                          style: TextStyle(
                            fontFamily: 'Share Tech',
                            color: MyPalette.darkBlue,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Container(padding: EdgeInsets.only(top: 20), child: w),
                    ],
                  ),
                ],
              );
            }
            return Container(
              child: Stack(
                alignment: Alignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
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
