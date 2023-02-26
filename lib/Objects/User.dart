class User
{
  String username;
  List<String> playlists;
  List<String> linkedDevices;
  Map<String,dynamic> settings;

  User(this.username, this.playlists, this.linkedDevices, this.settings);
}