
import 'package:flutter/material.dart';

import 'UserPage.dart';

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood Swing", style: TextStyle(fontFamily: 'Share Tech', fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (ctxt) {
                return UserPage();
              }));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Lorem Ipsum',
            ),
          ],
        ),
      ),

      // bottomNavigationBar: ConvexAppBar(
      //     style: TabStyle.textIn,
      //     items: [
      //       TabItem(icon: Icon(Icons.list), title: "Playlists"),
      //       TabItem(
      //         icon: Icon(Icons.create),
      //         title: "Create",
      //       ),
      //       TabItem(icon: Icon(Icons.settings), title: "Preferences"),
      //     ],
      //     onTap: (int index) {}),
    );
  }
}
