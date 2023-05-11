import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mood_swing/Objects/FileTypes.dart';
import 'package:mood_swing/Objects/Mood.dart';
import 'package:spotify/spotify.dart';

import 'SpotifyRouter.dart';

class DatabaseRouter {
  String uid = FirebaseAuth.instance.currentUser?.uid ?? "-1";

  /**
   * Check if the user has a database entry already
   */
  Future<bool> userExists(String uid) async {
    return (await FirebaseFirestore.instance.collection("users").doc(uid).get())
        .exists;
  }

  /**
   * Instantiates a user within the database
   */
  void createUser(String username) async {
    await FirebaseFirestore.instance.collection("users").doc(uid).set(
      {
        'name': username,
        'playlists': [],
        'linkedDevices': [],
        'classifiedSongs': [],
        'settings': {},
        'statistics': {},
        'spotifyLinked': false,
      },
    );
  }

  /**
   * Generates a random playlist from the cached songs within the database
   */
  Future<List<String>> generatePlaylist(
      List<String> userLikedSongs, Mood mood) async {
    List<String> playlist = [];
    for (String s in userLikedSongs) {
      DocumentSnapshot dref =
          await FirebaseFirestore.instance.collection("songs").doc(s).get();
      if (dref.get("mood") == mood.index) {
        playlist.add(s);
      }
    }
    return playlist;
  }

  /**
   * Uploads a file to Firebase Cloud Storage and returns the file path.
   */
  Future<String?> uploadFile(XFile? file, FileType encodingFormat) async {
    if (file != null) {
      String path = "Processing Data/file." + encodingFormat.getPostfix();
      TaskSnapshot snap = await FirebaseStorage.instance.ref(path).putData(
          await file.readAsBytes(),
          SettableMetadata(
            contentType: encodingFormat.getEncoding(),
          ));
      return snap.ref.fullPath;
    }
    return null;
  }

  Future<List<String>> getClassifiedSongs() async {
    DocumentSnapshot ds =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    List<String> vars = List<String>.from(ds.get("classifiedSongs"))
        .map((str) => str.trim())
        .toList();
    return vars;
  }

  void addToUser(List<String> songs) async {
    await FirebaseFirestore.instance.collection("users").doc(uid).set({
      "songsClassified": FieldValue.arrayUnion(songs),
    });
  }

  Future<bool> spotifyLinked() async {
    try {
      return (await FirebaseFirestore.instance
              .collection("users")
              .doc(uid)
              .get())
          .get('spotifyLinked');
    } on Exception catch (_) {
      return false;
    }
  }

  Future<SpotifyApiCredentials> getCredentials() async {
    DocumentSnapshot ds =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    return SpotifyApiCredentials(
      dotenv.env['SPOTIFY_CLIENT_ID'],
      dotenv.env['SPOTIFY_CLIENT_SECRET'],
      accessToken: ds.get("accessToken"),
      refreshToken: ds.get("refreshToken"),
      scopes: SpotifyRouter.scopesList,
      expiration:
          DateTime.parse(ds.get("credentialExpiration").toDate().toString()),
    );
  }

  void cacheCredentials(SpotifyApiCredentials creds) async {
    await FirebaseFirestore.instance.collection("users").doc(uid).update({
      "accessToken": creds.accessToken,
      "refreshToken": creds.refreshToken,
      "credentialExpiration": creds.expiration,
    });
  }
}
