import 'Song.dart';

class Playlist
{
  String uid;
  String name;
  Map<String, String> playlistLinks;
  List<Song> songs;

  Playlist(this.uid, this.name, this.playlistLinks, this.songs);

}