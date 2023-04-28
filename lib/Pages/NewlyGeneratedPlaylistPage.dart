import 'package:flutter/material.dart';
import 'package:mood_swing/Objects/Playlist.dart';
import 'dart:async';
import '../Objects/Song.dart';
import '../Widgets/widgets.dart';
import 'package:mood_swing/Utilities/APIRouter.dart';
import 'package:mood_swing/Utilities/SpotifyRouter.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

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
  TextEditingController playlistName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/appbarBG.png"), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          BackArrowBtn(),
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Container(
              width: 0.8 * width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///Holds the art and song list
                  Container(
                    height: 0.6 * height,
                    width: 0.4 * width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 0.05 * height),
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

                  ///song list and name
                  Container(
                    height: 0.55 * height,
                    width: 0.3 * width,
                    child: Container(
                      height: height - (height * 0.8),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 15),
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
                                hintText: 'Playlist Name',
                                enabledBorder: inputborder(),
                                focusedBorder: focusborder(),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05 * width),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OptionButtons(
                  text: 'Restart',
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: OptionButtons(
                    text: 'Continue',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

OutlineInputBorder inputborder() {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.white,
        width: 3,
      ));
}

OutlineInputBorder focusborder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: MyPalette.turqoise,
        width: 3,
      ));
}

class OptionButtons extends StatelessWidget {
  final String text;

  OptionButtons({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 0.016 * height),
      child: BouncingWidget(
        child: Container(
          width: 0.2 * width,
          height: 0.075 * height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                MyPalette.slateBlue,
                MyPalette.brightMagenta,
                MyPalette.turqoise,
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                color: MyPalette.brightMagenta,
                blurRadius: 16,
              )
            ],
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Share Tech',
                color: Colors.white,
              ),
            ),
          ),
        ),
        onPressed: () {},
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
