import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mood_swing/Objects/Song.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import '../Objects/Playlist.dart' as CP;

class SpotifyRouter {
  /**
   * Instantiates SpotifyRouter as singleton
   */
  static final SpotifyRouter _instance = SpotifyRouter._internal();
  String token = "";

  /**
   * Returns the instance of the Spotify Router singleton
   */
  factory SpotifyRouter() {
    return _instance;
  }

  /**
   * Instantiate the Spotify Router Singleton
   */
  SpotifyRouter._internal() {
    getToken();
  }

  /**
   * Gets the authentication token from a user authenticated spotify.
   */
  Future<String> getToken() async {
    if (token == "") {
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
    ///Instantiate the spotify client library
    String accessToken = await getToken();
    SpotifyApi client = SpotifyApi.withAccessToken(accessToken);

    ///Instantiate playlists with liked songs
    List<String> likedSongURLs = [];

    List<CP.Playlist> rPlaylists = [
      CP.Playlist(
          "",
          "Liked Songs",
          {},
          (await client.tracks.me.saved.all()).map<Song>((e) {
            likedSongURLs.add(e.track?.album?.images?[0].url ?? "");
            return Song(
                // e.track?.id ?? "",
                // e.track?.name ?? "", {});
                e.track?.id ?? "",
                e.track?.name ?? "",
                {},
                e.track?.artists?.map((e) => e.name ?? "").toList() ?? []);
          }).toList(),
          likedSongURLs)
    ];

    /// Add all other playlists into the list of playlists
    Iterable<PlaylistSimple> playlists = await client.playlists.me.all();

    for (PlaylistSimple p in playlists) {
      Iterable? data =
          (await client.playlists.get(p.id ?? "")).tracks?.itemsNative;
      List<Song>? songs = data?.map((e) {
        List<String> artists = List<String>.from(
            e["track"]["artists"].map((e) => e["name"] ?? "").toList());
        return Song("", e["track"]["name"], {}, artists);
      }).toList();

      rPlaylists.add(CP.Playlist("", p.name ?? "No name", {}, songs ?? [],
          p.images?.map((e) => e.url ?? "").toList() ?? []));
    }
    return rPlaylists;
  }
}
