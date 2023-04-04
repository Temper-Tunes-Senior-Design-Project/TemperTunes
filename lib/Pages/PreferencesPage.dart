import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/ChangeEmailPage.dart';
import 'package:mood_swing/Pages/UserPage.dart';
import 'package:mood_swing/Utilities/APIRouter.dart';
import 'package:mood_swing/Utilities/AuthRouter.dart';
import 'package:mood_swing/Utilities/SpotifyRouter.dart';
import 'package:mood_swing/Widgets/PreferenceOption.dart';
import 'ChangePasswordPage.dart';
import '../Widgets/widgets.dart';

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
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/loginPageLarge.png"),
                fit: BoxFit.cover),
          ),

          ///back arrow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 0.02 * height, left: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          ElevatedButton(
                            child: Icon(
                              const IconData(0xf05bc,
                                  fontFamily: 'MaterialIcons'),
                              color: Colors.white,
                              size: 40,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ///Main Container
              FittedBox(
                child: Container(
                  height: height * 0.8,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///logo
                      Container(
                        padding: EdgeInsets.only(top: 0.02 * height),
                        child: Image.asset("assets/music_swing_logo_small.png",
                            scale: 2.5),
                      ),

                      ///Preferences Title
                      FittedBox(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                              top: 0.03 * height, bottom: 0.03 * height),
                          child: Text(
                            'Preferences',
                            style: TextStyle(
                              fontSize: 53,
                              fontFamily: 'Share Tech',
                              color: MyPalette.lightPurple,
                            ),
                          ),
                        ),
                      ),
                      PreferenceOption("Account", height, width,
                          const IconData(0xe491, fontFamily: 'MaterialIcons'),
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserPage(),
                          ),
                        );
                      }),
                      PreferenceOption("Change Email", height, width,
                          const IconData(0xe22a, fontFamily: 'MaterialIcons'),
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeEmailPage(),
                          ),
                        );
                      }),
                      PreferenceOption("Change Password", height, width,
                          const IconData(0xf052b, fontFamily: 'MaterialIcons'),
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangePasswordPage(),
                          ),
                        );
                      }),
                      PreferenceOption(
                          "Adjust Presets",
                          height,
                          width,
                          const IconData(0xe91c, fontFamily: 'MaterialIcons'),
                          () {}),
                      PreferenceOption(
                          "Logout",
                          height,
                          width,
                          const IconData(0xe22a, fontFamily: 'MaterialIcons'),
                          () {}),
                      PreferenceOption(
                          "Delete Account",
                          height,
                          width,
                          const IconData(0xe3ae, fontFamily: 'MaterialIcons'),
                          () {}),
                      PreferenceOption(
                        "Link Spotify",
                        height,
                        width,
                        const IconData(0xe157, fontFamily: 'MaterialIcons'),
                        () async {
                          APIRouter().classifySpotifyLibrary();
                        },
                      ),
                    ],
                  ),
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
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            //set img to bg of body
            image: DecorationImage(
                image: AssetImage("assets/loginPageSmall.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              PreferenceOption("Account", height, width,
              const IconData(0xe491, fontFamily: 'MaterialIcons'),
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserPage(),
                  ),
                );
              }),
          PreferenceOption("Change Email", height, width,
              const IconData(0xe22a, fontFamily: 'MaterialIcons'),
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeEmailPage(),
                  ),
                );
              }),
          PreferenceOption("Change Password", height, width,
              const IconData(0xf052b, fontFamily: 'MaterialIcons'),
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordPage(),
                  ),
                );
              }),
          // PreferenceOption(
          //     "Adjust Presets",
          //     height,
          //     width,
          //     const IconData(0xe91c, fontFamily: 'MaterialIcons'),
          //         () {}),
          PreferenceOption(
              "Logout",
              height,
              width,
              const IconData(0xe22a, fontFamily: 'MaterialIcons'),
                  () {AuthRouter().logout(context);}),
          PreferenceOption(
              "Delete Account",
              height,
              width,
              const IconData(0xe3ae, fontFamily: 'MaterialIcons'),
                  () {}),
          PreferenceOption(
            "Link Spotify",
            height,
            width,
            const IconData(0xe157, fontFamily: 'MaterialIcons'),
                () async {
              APIRouter().classifySpotifyLibrary();
            },
          ),
            ],
          ),
        ),
      ),
    );
  }
}

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: Body());
  }
}
