import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/ChangeEmailPage.dart';
import 'package:mood_swing/Pages/ChangePasswordPage.dart';
import 'package:mood_swing/Utilities/APIRouter.dart';
import 'package:mood_swing/Pages/UserPage.dart';
import 'package:mood_swing/Utilities/SpotifyRouter.dart';
import '../Widgets/widgets.dart';
import 'package:mood_swing/Pages/LinkSpotifyPage.dart';

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
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ///back arrow
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  const IconData(0xf05bc, fontFamily: 'MaterialIcons'),
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () => Navigator.pop(context),
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
                      padding: EdgeInsets.only(top: 0.01 * height),
                      child: Image.asset("assets/music_swing_logo_small.png",
                          scale: 2.7),
                    ),

                    ///Preferences Title
                    FittedBox(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 0.01 * height),
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

                    ///Account

                    Center(
                      child: PreferenceOption(
                        "Account",
                        height,
                        width,
                        Icon(Icons.account_box_rounded,
                            color: Colors.white, size: 24),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserPage(),
                            ),
                          );
                        },
                        24,
                      ),
                    ),

                    ///Link To Spotify
                    PreferenceOption(
                      "Link Spotify",
                      height,
                      width,
                      Icon(Icons.link, color: Colors.white, size: 24),
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LinkSpotifyPage(),
                          ),
                        );
                      },
                      24,
                    ),

                    ///Email
                    PreferenceOption(
                      "Change Email",
                      height,
                      width,
                      Icon(Icons.email, color: Colors.white, size: 24),
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeEmailPage(),
                          ),
                        );
                      },
                      24,
                    ),

                    ///Change Password
                    PreferenceOption(
                      "Change Password",
                      height,
                      width,
                      Icon(Icons.key, color: Colors.white, size: 24),
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangePasswordPage(),
                          ),
                        );
                      },
                      24,
                    ),

                    ///Logout
                    PreferenceOption(
                      "Logout",
                      height,
                      width,
                      Icon(Icons.logout, color: Colors.white, size: 24),
                      () {},
                      24,
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
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/appBarBG.png"), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ///back button
            BackArrowBtn(),

            ///logo
            Container(
              padding: EdgeInsets.only(top: 0.02 * height),
              child:
                  Image.asset("assets/music_swing_logo_small.png", scale: 2.8),
            ),

            ///Preferences Title
            FittedBox(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 0.01 * height),
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

            ///Account
            Flexible(
              flex: 1,
              child: Center(
                child: PreferenceOption(
                  "Account",
                  height,
                  width,
                  Icon(Icons.account_box_rounded,
                      color: Colors.white, size: 24),
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserPage(),
                      ),
                    );
                  },
                  24,
                ),
              ),
            ),

            ///Link To Spotify
            Flexible(
              flex: 1,
              child: PreferenceOption(
                "Link Spotify",
                height,
                width,
                Icon(Icons.link, color: Colors.white, size: 24),
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserPage(),
                    ),
                  );
                },
                24,
              ),
            ),

            ///Email
            Flexible(
              flex: 1,
              child: PreferenceOption(
                "Change Email",
                height,
                width,
                Icon(Icons.email, color: Colors.white, size: 24),
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeEmailPage(),
                    ),
                  );
                },
                24,
              ),
            ),

            ///Change Password
            Flexible(
              flex: 1,
              child: PreferenceOption(
                "Change Password",
                height,
                width,
                Icon(Icons.key, color: Colors.white, size: 24),
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePasswordPage(),
                    ),
                  );
                },
                24,
              ),
            ),

            ///Logout
            Flexible(
              flex: 1,
              child: PreferenceOption(
                "Logout",
                height,
                width,
                Icon(Icons.logout, color: Colors.white, size: 24),
                () {},
                24,
              ),
            ),
          ],
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
