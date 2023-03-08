import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/LoginPage.dart';
import '../Widgets/widgets.dart';
import 'SignupPage.dart';

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

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 30),
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/landingPageBG.png"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: new Image.asset(
                "assets/music_swing_logo_med.png",
                height: height * 0.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.0, top: 0),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    child: Container(
                      //color: Colors.blue,
                      padding:
                          const EdgeInsets.all(0), //space between text and pic
                      child: Row(
                        //since the layout is broken into rows
                        children: [
                          //Expanded makes a child of a row, column, or flex expand to fill all spaces along main axis
                          Expanded(
                            //Column holds only Title+Subtitle
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    //TITLE
                                    child: const Text(
                                      'Mood Swing',
                                      style: TextStyle(
                                          fontFamily: 'Share Tech',
                                          color: MyPalette.lightPurple,
                                          fontSize: 65),
                                      textAlign: TextAlign.center,
                                    )),
                                //SUBTITLE
                                const Text(
                                  'Click to begin',
                                  style: TextStyle(
                                      fontFamily: 'Maven Pro',
                                      color: MyPalette.white,
                                      fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                //ICON
                                Container(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                        ),
                                        child: Icon(
                                          const IconData(0xe095,
                                              fontFamily: 'MaterialIcons'),
                                          color: MyPalette.white,
                                          size: 50,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignupPage()));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 0.07 * height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: new Image.asset("assets/music_swing_logo_small.png",
                  width: 370, height: 338),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.0, top: 0),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 0.09 * width), //space between text and pic
                      child: Row(
                        //since the layout is broken into rows
                        children: [
                          //Expanded makes a child of a row, column, or flex expand to fill all spaces along main axis
                          Container(
                            //Column holds only Title+Subtitle

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //TITLE
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: const Text('Mood Swing',
                                      style: TextStyle(
                                        fontFamily: 'Share Tech',
                                        color: MyPalette.lightPurple,
                                        fontSize: 55,
                                      ),
                                      textAlign: TextAlign.center),
                                ),

                                ///SUBTITLE
                                const Text(
                                  'Select to begin',
                                  style: TextStyle(
                                      fontFamily: 'Maven Pro',
                                      color: MyPalette.white,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                ////ICON
                                Container(
                                  padding: EdgeInsets.only(top: height * 0.07),
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                        ),
                                        child: Icon(
                                          IconData(0xe095,
                                              fontFamily: 'MaterialIcons'),
                                          color: MyPalette.white,
                                          size: 50,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoginPage(),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  'Select to begin',
                                  style: TextStyle(
                                      fontFamily: 'Maven Pro',
                                      color: MyPalette.white,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: height * 0.07),
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: CircleBorder(),
                                          ),
                                          child: Icon(
                                            const IconData(0xe095,
                                                fontFamily: 'MaterialIcons'),
                                            color: MyPalette.white,
                                            size: 50,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()));
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //   SizedBox(height: 0.05 * height),

            //      WaveAnimation(),
          ],
        ),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: DecoratedBox(
            //BoxDecoration has image
            decoration: BoxDecoration(
              //set img to bg of body
              image: DecorationImage(
                  image: AssetImage("assets/landingpageBG.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(children: [Body()])));
  }
}
