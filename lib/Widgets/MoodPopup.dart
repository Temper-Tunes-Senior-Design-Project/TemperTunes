import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Objects/Mood.dart';
import '../Utilities/APIRouter.dart';

class MoodPopup extends StatelessWidget {
  final String filePath;
  MoodPopup(this.filePath);

  @override
  Widget build(BuildContext context) {
    return AboutDialog(
      children: [
        FutureBuilder<Mood>(
          future: APIRouter().getUserMood(filePath),
          builder: (context, snapshot) {
            print("Rebuilding");
            if (snapshot.hasData) {
              return Text(snapshot.data?.name ?? "No data");
            }
            return Container(
              color: Colors.purple,
              height: 100,
              width: 100,
              child: SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            );
          },
        ),
      ],
    );
  }
}
