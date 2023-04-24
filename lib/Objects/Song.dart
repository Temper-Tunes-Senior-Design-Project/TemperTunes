class Song {
  String uid;
  String name;
  Map<String, String> artists;
  Map<String, String> songLinks;

  Song(this.uid, this.name, this.artists, this.songLinks);

  String get artist {
    return artists['artist'] ??
        ''; // Replace 'artist' with the actual key for artist name in your map
  }
}
