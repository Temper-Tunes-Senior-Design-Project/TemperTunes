import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class SpotifyRouter {
  Future<String> getToken() async {
    String redirect = (kIsWeb
            ? dotenv.env['SPOTIFY_WEB_REDIRECT_URI']
            : dotenv.env['SPOTIFY_REDIRECT_URI']) ??
        "";
    String accessToken = await SpotifySdk.getAccessToken(
        clientId: dotenv.env['SPOTIFY_CLIENT_ID'] ?? "",
        redirectUrl: redirect,
        scope:
            "app-remote-control,user-modify-playback-state,playlist-read-private");
    print("-------------------------------");
    print("Spotify Verification Successful");
    print("-------------------------------");
    print(accessToken);
    return accessToken;
  }
}
