import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mood_swing/Objects/Mood.dart';
import 'package:mood_swing/Utilities/AuthRouter.dart';

import 'SpotifyRouter.dart';

class APIRouter {

  Future<Mood> getUserMood(String firebasePath) async {
    Response response = await http
        .get(Uri.parse(
        "https://moodswing-mood-classifier-ilvif34q5a-ue.a.run.app/get_mood?storage_path=" + firebasePath))
        .timeout(Duration(minutes: 1));
    if (response.statusCode == 200) {
      Map<String, dynamic> resBody = jsonDecode(response.body);
      //Aggregate the moods to find the maximum value
      Mood m = Mood.values
          .where((element) =>
      element.name.toLowerCase() ==
          resBody.entries
              .reduce((value, element2) =>
          (double.tryParse(value.value)??0.0) >= (double.tryParse(element2.value)??0.0) ? value : element2)
              .key)
          .first;
      return m;
    }
    return Mood.Neutral;
  }

  /**
   * Classifies the users song library when they have authenticated with the application
   */
  void classifySpotifyLibrary() async
  {
    String token = await SpotifyRouter().getToken();
    String uid = AuthRouter().getUserUID();
    Response response = await http
        .get(Uri.parse(
        "https://user-song-classification-ilvif34q5a-ue.a.run.app/get_classified_mood?spotify_token="+ token+ "uid=" + uid ))
        .timeout(Duration(minutes: 1));
    if(response.statusCode == 200)
      {
        print("Successfully classified user songs");
      }
  }

}
