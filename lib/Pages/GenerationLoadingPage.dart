import 'package:flutter/material.dart';
import 'package:mood_swing/Utilities/APIRouter.dart';
import '../Objects/GenerationArguments.dart';
import '../Objects/Playlist.dart';
import '../Widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import '../Objects/Mood.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}

class LargeScreen extends StatelessWidget {
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
            image: AssetImage("assets/loginPageLarge.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BackArrowBtn(),
            FadeInDown(
              child: Container(
                height: height * 0.8,
                width: width * 0.4,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///Title
                    Title(46),

                    Subtitle(),

                    Expanded(
                      child: PlaylistContainer(),
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
            image: AssetImage("assets/loginPageLarge.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BackArrowBtn(),
            FadeInDown(
              child: Container(
                padding:
                    EdgeInsets.only(top: 0.01 * height, bottom: 0.01 * height),
                height: height * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///Title
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 0.04 * height),
                        child: Text(
                          'Select Your Device',
                          style: TextStyle(
                            fontSize: 49,
                            fontFamily: 'Share Tech',
                            color: MyPalette.lightPurple,
                          ),
                        ),
                      ),
                    ),

                    Subtitle(),

                    Expanded(
                      child: PlaylistContainer(),
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

class PlaylistContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GenerationArguments args =
        ModalRoute.of(context)!.settings.arguments as GenerationArguments;
    print("Test");
    return FutureBuilder<Playlist?>(
        future: APIRouter().generateClassification(args),
        builder: (context, snapshot) {
          snapshot.data?.songs.forEach((e) => print(e.name));
          return  WaveLoader(title: 'wave');
        });
  }
}

class GenerationLoadingPage extends StatelessWidget {
  GenerationLoadingPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Title extends StatelessWidget {
  final double fontSize;
  Title(this.fontSize);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 0.04 * height),
        child: Text(
          'Generating Playlist',
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Share Tech',
            color: MyPalette.lightPurple,
          ),
        ),
      ),
    );
  }
}

class Subtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          left: 0.01 * width, right: 0.01 * width, top: 0.02 * height),
      child: Text(
        "Please be patient while we create our playlist.",
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Maven Pro',
          color: Colors.white60,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
