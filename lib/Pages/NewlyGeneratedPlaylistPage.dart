import 'package:flutter/material.dart';
import 'package:mood_swing/Objects/GenerationArguments.dart';
import 'package:mood_swing/Objects/Playlist.dart';
import 'package:mood_swing/Pages/HomePage.dart';
import 'package:mood_swing/Utilities/SpotifyRouter.dart';
import '../Objects/Song.dart';
import '../Widgets/widgets.dart';
import 'package:mood_swing/Utilities/APIRouter.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        largeScreen: LargeScreen(), smallScreen: SmallScreen());
  }
}

class LargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GenerationArguments args =
        ModalRoute.of(context)!.settings.arguments as GenerationArguments;
    print("Test");
    return FutureBuilder<Playlist?>(
      future: APIRouter().generateClassification(args),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: WaveLoader(title: 'wave'),
          );
        }
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text("error fetching songs"),
          );
        }

        ///playlist songs content
        return SafeArea(
          child: LargePlaylistLayout(
            playlist: snapshot.data!,
          ),
        );
      },
    );
  }
}

class LargePlaylistLayout extends StatefulWidget {
  final Playlist playlist;
  LargePlaylistLayout({required this.playlist, super.key});

  @override
  _LargePlaylistLayoutState createState() => _LargePlaylistLayoutState();
}

class _LargePlaylistLayoutState extends State<LargePlaylistLayout> {
  TextEditingController playlistNameController = TextEditingController();
  // String _defaultPlaylistName = "Playlist1";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      ///background image
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/appbarBG.png"), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          BackArrowBtn(),

          ///Playlist Container
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
                              widget.playlist.songs[0].imageURl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20),

                  ///Playlist Name Form
                  Container(
                    height: 0.55 * height,
                    width: 0.3 * width,
                    child: Container(
                      height: height - (height * 0.8),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 15),
                              child:
                                  PlaylistNameForm(30, playlistNameController),
                            ),

                            ///Song list
                            SongListView(
                              songList: widget.playlist.songs,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///Save button
          Padding(
            padding: EdgeInsets.only(top: 0.05 * height),
            child: OptionButtons(
              text: 'Save',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Get the playlist name from the text controller
                  final playlistName = playlistNameController.text.isNotEmpty
                      ? playlistNameController.text
                      : "Playlist1";
                  ///Pass the name to the next page
                  widget.playlist.setName(playlistName);
                  await SpotifyRouter().publishPlaylist(widget.playlist);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                      (e) => false);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GenerationArguments args =
    ModalRoute.of(context)!.settings.arguments as GenerationArguments;
    return FutureBuilder<Playlist?>(
      future: APIRouter().generateClassification(args),
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

        ///playlist songs
        return SafeArea(
          child: SmallPlaylistLayout(
            playlist: snapshot.data!,
          ),
        );
      },
    );
  }
}

class SmallPlaylistLayout extends StatefulWidget {
  final Playlist playlist;
  SmallPlaylistLayout({required this.playlist, super.key});

  @override
  _SmallPlaylistLayoutState createState() => _SmallPlaylistLayoutState();
}

class _SmallPlaylistLayoutState extends State<SmallPlaylistLayout> {
  TextEditingController playlistNameController = TextEditingController();
  // String _defaultPlaylistName = "Playlist1";
  final _formKey = GlobalKey<FormState>();

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

          ///Playlist art
          Container(
            width: 0.7 * width,
            height: 0.4 * height,
            decoration: BoxDecoration(
              // color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Image.network(
              widget.playlist.songs[0].imageURl,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 0.03 * height),

          ///Playlist Name
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.2 * width),
              child: PlaylistNameForm(13, playlistNameController),
            ),
          ),

          OptionButtons(
            text: 'Save',
            onPressed: () async{
              if (_formKey.currentState!.validate()) {
                // Get the playlist name from the text controller
                final playlistName = playlistNameController.text.isNotEmpty
                    ? playlistNameController.text
                    : "Playlist1";
                widget.playlist.setName(playlistName);
                await SpotifyRouter().publishPlaylist(widget.playlist);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                        (e) => false);
              }
            },
          ),
          SizedBox(height: height * 0.03),

          Expanded(
            child: ListView.builder(
              itemCount: widget.playlist.songs.length,
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
                      widget.playlist.songs[index].name,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      widget.playlist.songs[index].artists.join(", "),
                      style: TextStyle(color: Colors.white54),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*
Just a temporary class. I just wanted to ensure that the playlistName and songlist were being passed
 */
class NextPage extends StatelessWidget {
  final String playlistName;
  final List<Song> songList;

  const NextPage({required this.playlistName, required this.songList});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 150,
          child: Text(playlistName),
        ),
        Container(
          height: 200,
          child: Image.network(songList[0].imageURl),
        ),
        SongListView(
          songList: songList,
        )
      ],
    );
  }
}

///Form where use puts playlist name
class PlaylistNameForm extends StatelessWidget {
  final TextEditingController controller;
  final double fontSize;

  PlaylistNameForm(this.fontSize, this.controller);
  @override
  Widget build(BuildContext) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Maven Pro',
        color: MyPalette.lightPurple,
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white60),
        hintText: 'Playlist Name',
        focusColor: Colors.white54,
        enabledBorder: inputborder(),
        focusedBorder: focusborder(),
      ),
    );
  }
}

///Formatting form
OutlineInputBorder inputborder() {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
    //Outline border type for TextFeild
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
      color: Colors.white,
      width: 3,
    ),
  );
}

OutlineInputBorder focusborder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: MyPalette.turqoise,
        width: 3,
      ));
}

///Save Button Formatting
class OptionButtons extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  // final double height;
  // final double width;

  OptionButtons({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 0.016 * height),
      child: BouncingWidget(
        child: Container(
          width: 0.2 * width,
          height: 0.05 * height,
          //  height: height,
          // width: width,
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
        onPressed: onPressed,
      ),
    );
  }
}

///Main function
class NewlyGeneratedPlaylistPage extends StatelessWidget {
  static const Key PageKey = Key("Newly Generated Playlist");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: PageKey,
      body: Body(),
    );
  }
}
