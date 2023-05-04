import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mood_swing/Objects/GenerationArguments.dart';
import 'package:mood_swing/Objects/Mood.dart';
import 'package:mood_swing/Objects/Playlist.dart';
import 'package:mood_swing/Utilities/AuthRouter.dart';
import 'package:mood_swing/Utilities/DatabaseRouter.dart';

import '../Objects/Song.dart';
import 'SpotifyRouter.dart';

class APIRouter {
  var handledErrorCodes = [400, 503];

  /**
   * Encompasses the entire playlist generation flow, including sorting closest
   * songs to user centroid and generating user playlist. Returns the playlist
   * generated.
   */
  Future<Playlist?> generatePlaylist(List<String> songs, Mood mood,
      double percentage_new_songs, int total_songs) async {
    var res = await _getClosestSongs(songs, mood);
    print(res);
    if (res.containsKey("error")) {
      return null; //returns the error
    }
    var closest_songs = res["closest_songs"];
    print(closest_songs);
    return await _buildPlaylist(
        mood, percentage_new_songs, total_songs, closest_songs);
  }

  /**
   * Builds a playlist for the user given the user's mood, percentage of new songs,
   * number of total songs, and list of closest song to the user's mood
   */
  Future<Playlist?> _buildPlaylist(Mood mood, double percentage_new_songs,
      int total_songs, List<String> closest_songs) async {
    var strMood = mood.toString();
    final url = "https://moodswing-generate-playlist-ilvif34q5a-ue.a.run.app";
    final headers = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Max-Age': '3600',
      'Content-Type': 'application/json'
    };
    final jsonBody = {
      'mood': strMood,
      'percentage_new_songs': percentage_new_songs,
      "total_songs": total_songs,
      "closest_songs": closest_songs
    };
    Response response = await http
        .post(Uri.parse(url), headers: headers, body: json.encode(jsonBody))
        .timeout(Duration(minutes: 1));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      final List<dynamic> songs = data['songs'];
      List<Song> spotifySongs = [];
      for (String songID in songs) {
        spotifySongs.add(await SpotifyRouter().getSong(songID));
      }

      return Playlist("-1", "Mood Swing Generated Playlist", {}, spotifySongs,
          spotifySongs.map((e) => e.imageURl).toList());
    } else if (handledErrorCodes.contains(response.statusCode)) {
      var resBody = jsonDecode(response.body);
      String error = resBody["error"]!;
      return null;
    } else {
      return null;
    }
  }

  /**
  * Sorts the user's song list by closest distance to the specified mood centroid
  */
  Future<Map<String, dynamic>> _getClosestSongs(
      List<String> songs, Mood mood) async {
    List<String> closestSongList = [];
    var uid = FirebaseAuth.instance.currentUser?.uid;
    var strMood = mood.toString();
    final url = "https://moodswing-closest-songs-ilvif34q5a-ue.a.run.app";
    final headers = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Max-Age': '3600',
      'Content-Type': 'application/json'
    };
    final jsonBody = {'mood': strMood, 'user_id': uid, "songs": songs};
    print("Sent JSON");
    // print(jsonBody);
    jsonBody.forEach((key, value) {
      print("key: " + key + " - value:" + value.toString());
      print("type:" + value.runtimeType.toString());
    });
    Response response = await http
        .post(Uri.parse(url), headers: headers, body: json.encode(jsonBody))
        .timeout(Duration(minutes: 1));
    print(response);
    if (response.statusCode == 200) {
      print(response.body);
      var resBody = jsonDecode(response.body);
      resBody["songs"]!.forEach((element) => closestSongList.add(element));
      return {"closest_songs": closestSongList};
    } else if (handledErrorCodes.contains(response.statusCode)) {
      var resBody = jsonDecode(response.body);
      String error = resBody["error"]!;
      return {"error": error};
    } else {
      return {"error": "Internal server error"};
    }
  }

  /**
   * Communicate with Firebase Cloud Function to categorize a user's photo/video
   * to a Mood enum classification.
   */
  Future<Mood?> getUserMood(String firebasePath) async {
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
    return null;
    return Mood.Happy;
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

  /**
   * Partition a list into x lists of 50
   */
  List<List<String>> partition(List<String> values) {
    List<List<String>> partitions = [];
    for (int i = 0; i < values.length; i += 50) {
      partitions.add(values.sublist(i, i + 50));
    }
    return partitions;
  }

  /**
   * Placeholder classification generation
   */
  Future<Playlist?> generateClassification(GenerationArguments args) async {
    ///Do some aggregation logic here
    print("Classifying");
    List<String> songLibrary = await DatabaseRouter().getClassifiedSongs();
    print(songLibrary);
    //check if the percentage was inputted as a value or a decimal
    args.newSongPercentage = formatPercentage(args.newSongPercentage);
    return await generatePlaylist(songLibrary, args.moods[0],
        args.newSongPercentage / 100, args.numberOfSongs);
  }

  double formatPercentage(double newSongPercentage) {
    return (newSongPercentage > 1.0)
        ? (newSongPercentage / 100 > 1)
            ? 1
            : newSongPercentage / 100
        : (newSongPercentage < 0.0)
            ? 0.0
            : newSongPercentage;
  }
}
