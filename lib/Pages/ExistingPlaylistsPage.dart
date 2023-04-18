import 'dart:math';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:mood_swing/Utilities/SpotifyRouter.dart';
import 'package:mood_swing/Widgets/MyPalette.dart';

import '../Objects/Playlist.dart';

class ExistingPlaylistsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExistingPlaylistsPageState();
  }
}

class ExistingPlaylistsPageState extends State<ExistingPlaylistsPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          //set img to bg of body
          image: DecorationImage(
              image: AssetImage("assets/loginPageSmall.png"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(128, 128, 128, 0),
          child: FutureBuilder<List<Playlist>>(
            future: SpotifyRouter().getSongLibrary(),
            builder: (context, snapshot)
            {
              if(snapshot.hasData && snapshot.data != null) {
                return GridView.builder(
                    itemCount: snapshot.data?.length??0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 50,
                      mainAxisSpacing: 50,
                      childAspectRatio: 4 / 3,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                snapshot.data![index].name,
                                style: TextStyle(
                                  fontFamily: 'Maven Pro',
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 200,
                                width: 200,
                                child: ListView.builder(
                                    itemCount: min(7, snapshot.data![index].songs.length),
                                    itemBuilder: (context, i) {
                                      return Text(
                                        snapshot.data![index].songs[i].name,
                                        style: TextStyle(
                                          fontFamily: 'Maven Pro',
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      );
                                    }
                                ),
                              ),
                            )
                          ],
                        ),
                        color: MyPalette.magenta,
                      );
                    });
              }
              else
                {
                  return CircularProgressIndicator();
                }
            }
          ),
        ),
      ),
    );
  }
}
