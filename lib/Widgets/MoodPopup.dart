import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Widgets/widgets.dart';
import 'package:aesthetic_dialogs/aesthetic_dialogs.dart';

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
      child: Container(
        height: height * 0.3,
        width: width * 0.3,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              MyPalette.slateBlue,
              MyPalette.brightMagenta,
              MyPalette.turqoise,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
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
              return Text(snapshot.data?.name ?? "No data");
            }
            emotion = APIRouter().getUserMood(filePath);
            return Container(
              color: Colors.purple,
              height: 100,
              width: 100,
              //child: Text(emotion as String),

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
