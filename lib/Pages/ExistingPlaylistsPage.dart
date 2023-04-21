import 'dart:math';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:mood_swing/Utilities/SpotifyRouter.dart';
import 'package:mood_swing/Widgets/MyPalette.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../Objects/Playlist.dart';

class ExistingPlaylistsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExistingPlaylistsPageState();
  }
}

///smalls screen will use an accordian
///https://pub.dev/packages/accordion

///For large screen: make it so that when you hover over it, it will display all the songs

class ExistingPlaylistsPageState extends State<ExistingPlaylistsPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isPlaylistSelected =
        false; // Track whether a playlist is selected or not

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/appBarBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 0.05 * width,
              vertical: 0.05 * height,
            ),
            child: Stack(
              children: [
                // FittedBox(
                //   fit: BoxFit.scaleDown,
                //   child: Center(
                //     child: Text(
                //       'Preferences',
                //       style: TextStyle(
                //         fontSize: 53,
                //         fontFamily: 'Share Tech',
                //         color: MyPalette.lightPurple,
                //       ),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // ),
                FutureBuilder<List<Playlist>>(
                  future: SpotifyRouter().getSongLibrary(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Stack(
                        children: [
                          GridView.builder(
                              itemCount: snapshot.data?.length ?? 0,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 0.04 * width,
                                mainAxisSpacing: 0.04 * height,
                                childAspectRatio: 4 / 3,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/music_swing_logo_small.png"),
                                        scale: 3.2,
                                        alignment: Alignment.center,
                                      ),
                                      color: MyPalette.circleIcon,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        snapshot.data![index].name,
                                        style: TextStyle(
                                          fontFamily: 'Maven Pro',
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    print("Clicked");
                                    setState(() {
                                      isPlaylistSelected = true;
                                    });
                                  },
                                );
                              }),
                          Visibility(
                            visible: true,
                            child: Center(
                              child: Container(
                                height: 500,
                                width: 500,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //   body: Container(
    //     height: height,
    //     width: width,
    //     decoration: BoxDecoration(
    //       //set img to bg of body
    //       image: DecorationImage(
    //           image: AssetImage("assets/loginPageSmall.png"),
    //           fit: BoxFit.cover),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.fromLTRB(128, 128, 128, 128),
    //       child: FutureBuilder<List<Playlist>>(
    //           future: SpotifyRouter().getSongLibrary(),
    //           builder: (context, snapshot) {
    //             if (snapshot.hasData && snapshot.data != null) {
    //               return GridView.builder(
    //                   itemCount: snapshot.data?.length ?? 0,
    //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                     crossAxisCount: 2,
    //                     crossAxisSpacing: 20,
    //                     mainAxisSpacing: 20,
    //                     childAspectRatio: 4 / 3,
    //                   ),
    //                   itemBuilder: (context, index) {
    //                     return Container(
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.center,
    //                         children: [
    //                           Align(
    //                             alignment: Alignment.topLeft,
    //                             child: Text(
    //                               snapshot.data![index].name,
    //                               style: TextStyle(
    //                                 fontFamily: 'Maven Pro',
    //                                 color: Colors.white,
    //                                 fontSize: 18,
    //                               ),
    //                             ),
    //                           ),
    //                           Expanded(
    //                             flex: 2,
    //                             child: Container(
    //                               height: height * 0.2,
    //                               width: width * 0.2,
    //                               color: Colors.greenAccent,
    //                               child: ListView.builder(
    //                                   itemCount: min(7,
    //                                       snapshot.data![index].songs.length),
    //                                   itemBuilder: (context, i) {
    //                                     return Text(
    //                                       snapshot.data![index].songs[i].name,
    //                                       style: TextStyle(
    //                                         fontFamily: 'Maven Pro',
    //                                         color: Colors.white,
    //                                         fontSize: 18,
    //                                       ),
    //                                     );
    //                                   }),
    //                             ),
    //                           )
    //                         ],
    //                       ),
    //                       color: MyPalette.hanPurple,
    //                       height: 0.2*height,
    //                       width: width*0.2,
    //                     );
    //                   });
    //             } else {
    //               return CircularProgressIndicator();
    //             }
    //           }),
    //     ),
    //   ),
    // );
  }
}
