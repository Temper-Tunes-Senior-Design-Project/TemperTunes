import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class SpotifyRouter
{
  Future<void> getToken() async{
    var accessToken = await SpotifySdk.getAccessToken(clientId: dotenv.env['SPOTIFY_CLIENT_ID']??"", redirectUrl:  dotenv.env['SPOTIFY_REDIRECT_URI']??"", scope: "app-remote-control,user-modify-playback-state,playlist-read-private");
    print("-------------------------------");
    print("Spotify Verification Successful");
    print("-------------------------------");

  }

}