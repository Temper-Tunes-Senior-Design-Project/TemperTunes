import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mood_swing/Objects/Song.dart';
import 'package:mood_swing/Utilities/AuthRouter.dart';
import 'package:mood_swing/Utilities/DatabaseRouter.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:spotify_sdk/spotify_sdk_web.dart';
import '../Objects/Playlist.dart' as CP;

class SpotifyRouter {
  /**
   * Instantiates SpotifyRouter as singleton
   */
  static final SpotifyRouter _instance = SpotifyRouter._internal();
  String token = "";
  SpotifyApi? client;
  static final String scopes =
      "app-remote-control,user-modify-playback-state,playlist-read-private,user-library-read";
  static final List<String> scopesList = [
    "app-remote-control",
    "user-modify-playback-state",
    "playlist-read-private",
    "user-library-read"
  ];

  /**
   * Returns the instance of the Spotify Router singleton
   */
  factory SpotifyRouter() {
    return _instance;
  }

  /**
   * Instantiate the Spotify Router Singleton
   */
  SpotifyRouter._internal() {}

  /**
   * Instantiates the Spotify client with refresh credentials.
   */
  void instantiateClient() async {
    SpotifyApi? api;
    if (await DatabaseRouter().spotifyLinked()) {
      SpotifyApiCredentials credentials = await DatabaseRouter().getCredentials();
      api = SpotifyApi(
        credentials,
        onCredentialsRefreshed: (SpotifyApiCredentials newCred) async {
          DatabaseRouter().cacheCredentials(newCred);
        },
      );
    } else {
      //Send user to the link spotify page from the Home Page
      //Navigator.push();
    }
    client = api;
  }

  /**
   * Gets the authentication token from a user authenticated spotify.
   */
  Future<String> getToken() async {
    String uid = AuthRouter().getUserUID();
    SpotifySdkPlugin.tokenSwapURL =
        "http://192.168.1.161:8080/main/?uid=" + uid;
    if (token == "") {
      print("Token doesn't exist");
      String redirect = (kIsWeb
              ? dotenv.env['SPOTIFY_WEB_REDIRECT_URI']
              : dotenv.env['SPOTIFY_REDIRECT_URI']) ??
          "";
      String accessToken = await SpotifySdk.getAccessToken(
          clientId: dotenv.env['SPOTIFY_CLIENT_ID'] ?? "",
          redirectUrl: redirect,
          scope:
              "app-remote-control,user-modify-playback-state,playlist-read-private,user-library-read");
      token = accessToken;
      return accessToken;
    } else {
      return token;
    }
  }

  /**
   * Gets all of the user's playlists
   */
  Future<List<CP.Playlist>> getSongLibrary() async {
    ///Instantiate playlists with liked songs
    assert(client != null);
    Iterable<TrackSaved> tracks = await client!.tracks.me.saved.all();
    List<CP.Playlist> rPlaylists = [
      CP.Playlist(
          "No ID exists for Liked Songs",
          "Liked Songs",
          {},
          tracks.map<Song>((e) {
            return Song(
                e.track?.id ?? "",
                e.track?.name ?? "",
                {},
                e.track?.artists?.map((e) => e.name ?? "").toList() ?? [],
                e.track?.album?.images?[0].url ?? "");
          }).toList(),
          tracks.fold<List<String>>(
              [],
              (previousValue, element) => [
                    ...previousValue,
                    element.track?.album?.images?[0].url ?? ""
                  ]))
    ];

    /// Add all other playlists into the list of playlists
    Iterable<PlaylistSimple> playlists = await client!.playlists.me.all();

    for (PlaylistSimple p in playlists) {
      Iterable? data =
          (await client!.playlists.get(p.id ?? "")).tracks?.itemsNative;
      List<Song>? songs = data?.map((e) {
        List<String> artists = List<String>.from(
            e["track"]["artists"].map((e) => e["name"] ?? "").toList());
        return Song("", e["track"]["name"], {}, artists, "");
      }).toList();

      rPlaylists.add(CP.Playlist(p.id ?? "No id exists", p.name ?? "No name",
          {}, songs ?? [], p.images?.map((e) => e.url ?? "").toList() ?? []));
    }
    return rPlaylists;
  }

  /** Get the songs in the user's newly generated playlist
   */
  Future<Song> getSong(String uid) async {
    ///Instantiate the spotify client library

    Track t = await client!.tracks.get(uid);
    return Song(
        t.id ?? "",
        t.name ?? "",
        {},
        t.artists?.map((e) => e.name ?? "").toList() ?? [],
        t.album?.images?[0].url ?? "");
  }

  /**
   * Publish the playlist to Spotify.
   */
  Future<void> publishPlaylist(CP.Playlist cp) async {
    String accessToken = await getToken();
    SpotifyApi client = SpotifyApi.withAccessToken(accessToken);
    Playlist p = await client.playlists
        .createPlaylist((await client.me.get()).id ?? "", cp.name);
    List<String> uris = [];
    for (Song s in cp.songs) {
      uris.add((await client.tracks.get(s.uid)).uri ?? "");
    }
    await client.playlists.addTracks(uris, p.id ?? "");
  }

  /**
   * Gets all of the songs for use in classification
   */
  Future<List<Song>> getAllSongs() async {
    return (await getSongLibrary()).fold<List<Song>>([],
        (previousValue, element) {
      return [...previousValue, ...element.songs];
    });
  }
}
