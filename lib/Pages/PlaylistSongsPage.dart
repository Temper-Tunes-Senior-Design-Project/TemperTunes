import 'package:easy_stepper/easy_stepper.dart';
import '../Widgets/widgets.dart';

import '../Objects/Playlist.dart';

class Body extends StatelessWidget {
  late final Playlist playlist;

  Body({required this.playlist});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(playlist: playlist),
      smallScreen: SmallScreen(playlist: playlist),
    );
  }
}

class LargeScreen extends StatelessWidget {
  final Playlist playlist;

  LargeScreen({required this.playlist, super.key});

  @override
  Widget build(BuildContext context) {
    // Build the UI for the playlist songs page using the playlist data
    // passed in the constructor
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/userPageLarge.png"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BackArrowBtn(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 0.05 * width, vertical: 0.05 * height),
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
                      height: 0.8 * height,
                      width: 0.4 * width,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.05 * height),
                                child: Image.network(
                                  playlist.images[0],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ]),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 0.6 * height,
                      width: 0.45 * width,
                      child: Container(
                        height: height - (height * 0.8),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                '${playlist.name}',
                                style: TextStyle(
                                  fontFamily: 'Maven Pro',
                                  color: MyPalette.magenta,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SongListView(songList: playlist.songs),
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
      ),
    );
  }
}

class SmallScreen extends StatelessWidget {
  final Playlist playlist;

  SmallScreen({required this.playlist, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/appBarBG.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            BackArrowBtn(),

            ///Title
            Container(
              child: Text(
                '${playlist.name}',
                style: TextStyle(
                  fontFamily: 'Maven Pro',
                  color: MyPalette.magenta,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            SizedBox(height: 0.01 * height),

            ///Image of the playlist
            Container(
              height: height * 0.4,
              width: 0.76 * width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    playlist.images[0],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            ///Name of Playlist

            SizedBox(height: 15),
            SongListView(songList: playlist.songs),
          ],
        ),
      ),
    );
  }
}

class PlaylistSongsPage extends StatelessWidget {
  final Playlist playlist;

  PlaylistSongsPage({required this.playlist, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(playlist: playlist),
    );
  }
}
