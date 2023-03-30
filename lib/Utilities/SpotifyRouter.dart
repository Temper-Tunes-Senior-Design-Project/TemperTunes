import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class SpotifyRouter
{
  String webRedirectURL =  dotenv.env['SPOTIFY_WEB_REDIRECT_URI']??"";
  Future<String> getToken() async{
    String accessToken = await SpotifySdk.getAccessToken(clientId: dotenv.env['SPOTIFY_CLIENT_ID']??"", redirectUrl:  webRedirectURL, scope: "app-remote-control,user-modify-playback-state,playlist-read-private");
    print("-------------------------------");
    print("Spotify Verification Successful");
    print("-------------------------------");
    print(accessToken);
    return accessToken;
  }
}