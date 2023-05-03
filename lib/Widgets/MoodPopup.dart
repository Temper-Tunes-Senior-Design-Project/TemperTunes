import 'package:flutter/material.dart';
import '../Objects/GenerationArguments.dart';
import '../Widgets/widgets.dart';

import '../Objects/Mood.dart';
import '../Utilities/APIRouter.dart';

class MoodPopup extends StatelessWidget {
  final String filePath;
  final GenerationArguments args;
  MoodPopup({required this.filePath, required this.args});

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
        width: width * 0.2,
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: FutureBuilder<Mood?>(
          future: APIRouter().getUserMood(filePath),
          builder: (context, snapshot) {
            print("Rebuilding");
            if (snapshot.hasData) {
              Widget w = Container();
              switch (snapshot.data!) {
                case Mood.Angry:
                  w = Image.asset("assets/angry.png", height: 0.15 * height);
                  break;
                case Mood.Tired:
                  w = Image.asset("assets/tired.png", height: 0.15 * height);
                  break;
                case Mood.Content:
                  w = Image.asset("assets/content.png", height: 0.15 * height);
                  break;
                case Mood.Depressed:
                  w = Image.asset("assets/depressed.png",
                      height: 0.15 * height);
                  break;
                case Mood.Energetic:
                  w = Image.asset("assets/energetic.png",
                      height: 0.15 * height);
                  break;
                case Mood.Excited:
                  w = Image.asset("assets/excited.png", height: 0.15 * height);
                  break;
                case Mood.Happy:
                  w = Image.asset("assets/happy.png", height: 0.15 * height);
                  break;
                case Mood.Sad:
                  w = Image.asset("assets/sad.png", height: 0.15 * height);
                  break;
                default:
                  w = Text("ERROR - emotion could not be identified");

                  break;
              }

              ///For adding emotion icons
              return Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  ///Buttons

                  //Back
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                          hoverColor: Color.fromARGB(255, 124, 77, 255),
                          hoverElevation: height * 0.035,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        hoverColor: Color.fromARGB(255, 124, 77, 255),
                        hoverElevation: height * 0.035,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('Yes'),
                        onPressed: () {
                          args.moods.add(snapshot.data!);
                          if (args.route == GenerationRoutes.Both) {
                            Navigator.pushNamed(
                              context,
                              '/bluetooth',
                              arguments: args,
                            );
                          } else {
                            Navigator.pushNamed(
                              context,
                              '/compiling',
                              arguments: args,
                            );
                          }
                        },
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: height * 0.08),
                        child: Text(
                          "Did we correctly identify your mood?",
                          style: TextStyle(
                            fontFamily: 'Maven Pro',
                            fontWeight: FontWeight.w300,
                            color: MyPalette.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: height * 0.01),
                        child: Text(
                          snapshot.data?.name ?? "No data",
                          style: TextStyle(
                            fontFamily: 'Maven Pro',
                            fontWeight: FontWeight.w800,
                            color: MyPalette.darkBlue,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Positioned(
                    top: -height * 0.1,
                    child: Container(
                      alignment: Alignment.center,
                      child: w,
                    ),
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
            );
          },
        ),
      ),
    );
  }
}
