import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mood_swing/Objects/Mood.dart';
import 'package:mood_swing/Utilities/AuthRouter.dart';

import 'SpotifyRouter.dart';

class APIRouter {
  /**
   * Communicate with Firebase Cloud Function to categorize a user's photo/video
   * to a Mood enum classification.
   */
  Future<Mood> getUserMood(String firebasePath) async {
    ///Send a response to the cloud function
    Response response = await http
        .get(Uri.parse(
            "https://moodswing-mood-classifier-ilvif34q5a-ue.a.run.app/get_mood?storage_path=" +
                firebasePath))
        .timeout(Duration(minutes: 1));
    if (response.statusCode == 200) {
      //constants
      int LOW = 0;
      int MEDIUM = 1;
      int HIGH = 2;
      Map<String, dynamic> resBody = jsonDecode(response.body);
      var valence = resBody["valence"]!;
      var arousal = resBody["arousal"]!;
      //get size label of valence and arousal
      int toLabeledSize(double val) => (val >= 0.5)
          ? HIGH
          : (val <= -0.5)
              ? LOW
              : MEDIUM;
      var valenceLabel = toLabeledSize(valence);
      var arousalLabel = toLabeledSize(arousal);

      if (valenceLabel == MEDIUM && arousalLabel == MEDIUM) {
        //case where both are medium
        valenceLabel = (valence > 0.25)
            ? HIGH
            : (valence < -0.25)
                ? LOW
                : MEDIUM;
        arousalLabel = (arousal > 0.25)
            ? HIGH
            : (arousal < -0.25)
                ? LOW
                : MEDIUM;
        //check if they are both still medium
        if (valenceLabel == MEDIUM && arousalLabel == MEDIUM) {
          var valenceIsBiggerExtreme = (valence.abs() <= arousal.abs());
          valenceLabel = (valenceIsBiggerExtreme)
              ? (valence < 0)
                  ? LOW
                  : HIGH
              : valenceLabel;
          arousalLabel = (!valenceIsBiggerExtreme)
              ? (arousal < 0)
                  ? LOW
                  : HIGH
              : arousalLabel;
        }
      }

      return valenceArousalToLabel[valenceLabel][arousalLabel];
    }
    return Mood.Neutral;
  }

  /**
   * Classifies the users song library when they have authenticated with the application
   */
  void classifySpotifyLibrary() async {
    String token = await SpotifyRouter().getToken();
    String uid = AuthRouter().getUserUID();
    Response response = await http
        .get(Uri.parse(
            "https://user-song-classification-ilvif34q5a-ue.a.run.app/get_classified_mood?spotify_token=" +
                token +
                "uid=" +
                uid))
        .timeout(Duration(minutes: 1));
    if (response.statusCode == 200) {
      print("Successfully classified user songs");
    }
  }
}
