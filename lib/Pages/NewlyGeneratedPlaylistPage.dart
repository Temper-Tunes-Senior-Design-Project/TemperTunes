import 'package:flutter/material.dart';
import 'package:mood_swing/Objects/Playlist.dart';
import 'dart:async';
import '../Objects/Song.dart';
import '../Widgets/widgets.dart';
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

    return FutureBuilder<Playlist>(
      future: APIRouter().fetchSongs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("error fetching songs"),
          );
        }
        List<Song> songs = snapshot.data?.songs ?? [];

        ///playlist songs
        return SafeArea(
          child: LargePlaylistLayout(
            songList: songs,
          ),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       height: 200,
          //       child: Image.network(songs[0].imageURl),
          //     ),
          //     Expanded(
          //       child: ListView.builder(
          //         itemCount: songs.length,
          //         itemBuilder: (context, index) {
          //           Song song = songs[index];
          //           String formattedSong =
          //               '${song.name} by ${song.artists.join(", ")}';
          //           return ListTile(
          //             title: Text(formattedSong),
          //           );
          //         },
          //       ),
          //     ),
          //   ],
          // ),
        );
      },
    );
  }
}

class LargePlaylistLayout extends StatefulWidget {
  final List<Song> songList;

  LargePlaylistLayout({required this.songList, super.key});

  @override
  _LargePlaylistLayoutState createState() => _LargePlaylistLayoutState();
}

class _LargePlaylistLayoutState extends State<LargePlaylistLayout> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/userPageLarge.png"), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          BackArrowBtn(),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///Playlist cover
                  Container(
                    height: 0.7 * height,
                    width: 0.35 * width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 0.1 * height),
                            child: Image.network(
                              widget.songList[0].imageURl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20),
                  Container(
                    height: 0.6 * height,
                    width: 0.4 * width,
                    child: Container(
                      height: height - (height * 0.8),
                      child: Column(
                        children: [
                          Container(
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                color: MyPalette.magenta,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white60),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: widget.songList.length,
                              itemBuilder: (context, index) {
                                // Build the list of songs using the playlist data
                                return ListTile(
                                  title: Text(
                                    widget.songList[index].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: Text(
                                    widget.songList[index].artists.join(", "),
                                    style: TextStyle(color: Colors.white54),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewlyGeneratedPlaylistPage extends StatelessWidget {
  static const Key PageKey = Key("Testing Page");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: PageKey,

      body: Body(),
    );
  }
}
