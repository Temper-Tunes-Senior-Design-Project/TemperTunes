import 'dart:math';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:mood_swing/Utilities/SpotifyRouter.dart';
import 'package:mood_swing/Widgets/MyPalette.dart';
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

class LargeScreen extends StatefulWidget {
  final Playlist playlist;

  LargeScreen({required this.playlist, super.key});

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  @override
  Widget build(BuildContext context) {
    // Build the UI for the playlist songs page using the playlist data
    // passed in the constructor
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///Playlist cover
                Container(
                  padding: EdgeInsets.only(left: 0.1 * width),
                  height: 0.8 * height,
                  width: 0.45 * width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: 0.8 * height,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  widget.playlist.images[0],
                                ),
                              ),
                            ))
                      ]),
                ),
                Container(
                  padding: EdgeInsets.only(right: 0.1 * width),
                  height: 0.8 * height,
                  width: 0.45 * width,
                  color: Colors.green,
                  child: Column(
                    children: [
                      Container(
                        height: height - (height * 0.8),
                        child: Column(
                          children: [
                            Container(
                              height: 0.1 * (height - (height * 0.8)),
                              child: Text(
                                'Playlist: ${widget.playlist.name}',
                                style: TextStyle(
                                  fontFamily: 'Maven Pro',
                                  color: Colors.blue,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: widget.playlist.songs.length,
                                itemBuilder: (context, index) {
                                  // Build the list of songs using the playlist data
                                  return ListTile(
                                    title:
                                        Text(widget.playlist.songs[index].name),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ])
          // ListView.builder(
          //   itemCount: widget.playlist.songs.length,
          //   itemBuilder: (context, index) {
          //     // Build the list of songs using the playlist data
          //     return ListTile(
          //       title: Text(widget.playlist.songs[index].name),
          //
          //       // Add any other song-related UI components as needed
          //     );
          //   },
          // ),
          ),
    );
  }
}

class SmallScreen extends StatefulWidget {
  final Playlist playlist;

  SmallScreen({required this.playlist, super.key});

  @override
  _SmallScreenState createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen> {
  @override
  Widget build(BuildContext context) {
    // Build the UI for the playlist songs page using the playlist data
    // passed in the constructor

    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist: ${widget.playlist.name}'),
      ),
      body: ListView.builder(
        itemCount: widget.playlist.songs.length,
        itemBuilder: (context, index) {
          // Build the list of songs using the playlist data
          return ListTile(
            title: Text(widget.playlist.songs[index].name),

            // Add any other song-related UI components as needed
          );
        },
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

//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           height: height,
//           width: width,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/appBarBG.png'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Column(
//             children: [
//               Text(
//                 'Songs in ${widget.playlist.name}',
//                 style: TextStyle(color: Colors.white),
//               ),
//               ListView.builder(
//                   itemCount: widget.playlist.songs.length,
//                   itemBuilder: (context, i) {
//                     return Text(
//                       widget.playlist.songs[i].name,
//                       style: TextStyle(
//                         fontFamily: 'Maven Pro',
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     );
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
