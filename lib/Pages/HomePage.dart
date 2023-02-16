import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/UserPage.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatelessWidget {
  static Key UserButtonKey = Key("User Button");
  HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SmallScreen(),
      ),
      bottomNavigationBar: ConvexAppBar(
          style: TabStyle.textIn,
          items: [
            TabItem(icon: Icon(Icons.list), title: "Playlists"),
            TabItem(
              icon: Icon(Icons.create),
              title: "Create",
            ),
            TabItem(icon: Icon(Icons.settings), title: "Preferences"),
          ],
          onTap: (int index) {}),
    );
  }
}



class SmallScreen extends StatelessWidget {
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
              image: AssetImage("assets/appBarBG.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.only(left:0, top: 0.06*height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              ///Profile Icon
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        IconData(0xe491, fontFamily: 'MaterialIcons'),
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserPage()));
                      },
                    ),
                  ],
                ),
              ),


              Container(
                child: Column(
                  children: [
                    ///Logo
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(
                          top: height * 0.01, bottom: height * 0.012),
                      child: Image.asset("assets/music_swing_logo_small.png",
                          scale: 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
