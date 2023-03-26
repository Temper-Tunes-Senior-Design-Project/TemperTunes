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
      child: SafeArea(
        // maintainBottomViewPadding: false,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/appBarBG.png"), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: height * 0.01),
              Container(
                padding: EdgeInsets.only(top: 0.02 * height),
                alignment: Alignment.center,
                child: new Image.asset(
                  "assets/music_swing_logo_med.png",
                  height: height * 0.45,
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          //Expanded makes a child of a row, column, or flex expand to fill all spaces along main axis
                          Expanded(
                            //Column holds only Title+Subtitle
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: Container(
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
                                ),
                                //SUBTITLE

                                FittedBox(
                                  child: const Text(
                                    'Click to begin',
                                    style: TextStyle(
                                        fontFamily: 'Maven Pro',
                                        color: MyPalette.white,
                                        fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                                ///ICON
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 20, bottom: 0.01 * height),
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
                                                  SignupPage(),
                                            ),
                                          );
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
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: WaveAnimation(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SafeArea(
        bottom: false,
        top: true,
        left: false,
        right: false,
        maintainBottomViewPadding: false,
        child: Container(
          height: height,
          padding: EdgeInsets.only(top: 0.01 * height),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/appBarBG.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: new Image.asset("assets/music_swing_logo_small.png",
                    height: 0.4 * height),
              ),
              SizedBox(
                height: height * 0.01,
              ), //space between logo and text
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //since the layout is broken into rows
                          children: [
                            //Expanded makes a child of a row, column, or flex expand to fill all spaces along main axis
                            Center(
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
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),

                                  ///ICON
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: height * 0.05),
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
                                                    LoginPage(),
                                              ),
                                            );
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
              //    color: Colors.pink,
              Expanded(
                flex: 1,
                child: WaveAnimation(),
              ),
            ],
          ),
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
        resizeToAvoidBottomInset: false, body: Column(children: [Body()]));
  }
}
