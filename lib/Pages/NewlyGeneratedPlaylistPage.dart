import 'package:flutter/material.dart';
import 'dart:async';
import '../Objects/Song.dart';
import '../Widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:mood_swing/Utilities/APIRouter.dart';
import 'package:mood_swing/Utilities/SpotifyRouter.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
    );
  }
}

class LargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return FutureBuilder<List<String>>(
      key: UniqueKey(),
      future: APIRouter().fetchSongs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("error fetching songs"),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<String> songs = snapshot.data!;
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  child: Text(
                    'test page',
                    style: TextStyle(
                      fontSize: 80,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder<Song>(
                        future: SpotifyRouter().getSong(songs[index]),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return ListTile(
                              title: Text('Loading... '),
                            );
                          }
                          if (snapshot.hasError) {
                            return ListTile(
                              title: Text('Error fetching song'),
                            );
                          }
                          Song song = snapshot.data!;
                          String formattedSong = '${song.name}';
                          return ListTile(
                            title: Text(formattedSong),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Text("Unknown connection state"),
          );
        }
      },
    );
  }
}

class NewlyGeneratedPlaylistPage extends StatelessWidget {
  static const Key PageKey = Key("Generated Playlist Page");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: PageKey,

      body: Body(),
    );
  }
}
