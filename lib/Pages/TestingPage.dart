import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mood_swing/Utilities/APIRouter.dart';

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

    return FutureBuilder<List<String>>(
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
        List<String> songs = snapshot.data!;
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                child: Text(
                  'test page',
                  style: TextStyle(
                    fontSize: 80,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: songs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(songs[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    // return SafeArea(
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Container(
    //         child: Text(
    //           'TEST PAGE',
    //           style: TextStyle(
    //             fontSize: 80,
    //             color: Colors.purple,
    //           ),
    //         ),
    //       ),
    //       Column(children: [])
    //     ],
    //   ),
    // );
  }
}

class TestingPage extends StatelessWidget {
  static const Key PageKey = Key("Testing Page");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: PageKey,

      body: Body(),
    );
  }
}
