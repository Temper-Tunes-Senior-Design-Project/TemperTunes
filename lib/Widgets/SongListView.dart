import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';
import '../Objects/Song.dart';

class SongListView extends StatelessWidget {
  final List<Song> songList;
  SongListView({required this.songList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: songList.length,
        itemBuilder: (context, index) {
          // Build the list of songs using the playlist data
          return Card(
            color: MyPalette.lightPurple.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: ListTile(
              title: Text(
                songList[index].name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                songList[index].artists.join(", "),
                style: TextStyle(color: Colors.white54),
              ),
            ),
          );
        },
      ),
    );
  }
}
