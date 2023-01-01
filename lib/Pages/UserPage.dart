import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../Widgets/GridText.dart';
import '../Widgets/ImageHelper.dart';

class UserPage extends StatelessWidget {
  static const Key PageKey = Key("User Page");
  UserPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: PageKey,
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("Mood Swing"),
        actions: [
          Icon(Icons.person),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150,
            child: Row(
              children: [
                Container(
                    child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png")),
                Expanded(
                  child: Container(
                    height: 198,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("John Doe"),
                        Text("Member Since: September 2022"),
                        Container(
                          height: 100,
                          width: 250,
                          child: Card(
                            child: Container(
                              height: 100,
                              child: GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                childAspectRatio: 10 / 4,
                                crossAxisSpacing: 0,
                                crossAxisCount: 2,
                                mainAxisSpacing: 0,
                                //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 0),
                                padding: EdgeInsets.zero,
                                children: [
                                  GridText("14", "Playlists"),
                                  GridText("103", "Total Songs"),
                                  GridText("13", "Classifications"),
                                  GridText("4", "Devices"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Text("Your Accounts"),
          ),
          Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 75,
                    child: ImageHelper(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Spotify_logo_without_text.svg/252px-Spotify_logo_without_text.svg.png?20160123212544',
                        'Spotify')),
                SizedBox(
                    height: 75,
                    child: ImageHelper(
                        'https://static.wikia.nocookie.net/logopedia/images/a/aa/Ic_launcher.png/revision/latest?cb=20201027194703',
                        'Apple Music')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Text("Your Devices"),
          ),
          Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 75,
                    width: 105,
                    child: ImageHelper(
                        'https://cdn1.vectorstock.com/i/thumb-large/13/00/watch-icon-on-white-vector-22181300.jpg',
                        'John Doe\'s Apple Watch')),
                SizedBox(
                    height: 75,
                    width: 105,
                    child: ImageHelper(
                        'https://cdn1.vectorstock.com/i/thumb-large/13/00/watch-icon-on-white-vector-22181300.jpg',
                        'Fitbit 7502')),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
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
