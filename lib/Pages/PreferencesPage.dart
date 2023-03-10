import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/ChangeEmailPage.dart';
import 'package:mood_swing/Pages/UserPage.dart';
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
              padding: EdgeInsets.only(top: 0.03 * height, left: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        ElevatedButton(
                          child: Icon(
                            IconData(0xf05bc, fontFamily: 'MaterialIcons'),
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

                    ///Account
                    Container(
                      child: TextButton(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Icon(
                                  IconData(0xe491, fontFamily: 'MaterialIcons'),
                                  color: MyPalette.white,
                                  size: 24,
                                ),
                              ),

                              ///label
                              Container(
                                padding: EdgeInsets.only(left: 0.01 * width),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Account',
                                  style: TextStyle(
                                    fontFamily: 'Maven Pro',
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                        ),
                      ),
                    ),

                    ///Change Email
                    Container(
                      padding: EdgeInsets.only(top: 0.035 * height),
                      child: TextButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Icon(
                                    IconData(0xe22a,
                                        fontFamily: 'MaterialIcons'),
                                    color: MyPalette.white,
                                    size: 24,
                                  )),

                              ///Name
                              Container(
                                padding: EdgeInsets.only(left: 0.01 * width),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Change Email',
                                  style: TextStyle(
                                    fontFamily: 'Maven Pro',
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangeEmailPage(),
                              ),
                            );
                          }),
                    ),

                    ///Change Password
                    Container(
                      padding: EdgeInsets.only(top: 0.035 * height),
                      child: TextButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Icon(
                                    IconData(0xf052b,
                                        fontFamily: 'MaterialIcons'),
                                    color: MyPalette.white,
                                    size: 24,
                                  )),
                              Container(
                                padding: EdgeInsets.only(left: 0.01 * width),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Change Password',
                                  style: TextStyle(
                                    fontFamily: 'Maven Pro',
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangePasswordPage(),
                              ),
                            );
                          }),
                    ),

                    ///Adjust Presets
                    Container(
                      padding: EdgeInsets.only(top: 0.035 * height),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                IconData(0xe91c, fontFamily: 'MaterialIcons'),
                                color: MyPalette.white,
                                size: 24,
                              )),

                          ///Name
                          Container(
                            padding: EdgeInsets.only(left: 0.01 * width),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Adjust Presets',
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///Logout
                    Container(
                      padding: EdgeInsets.only(top: 0.035 * height),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                IconData(0xe9ba, fontFamily: 'MaterialIcons'),
                                color: MyPalette.white,
                                size: 24,
                              )),

                          ///Name
                          Container(
                            padding: EdgeInsets.only(left: 0.01 * width),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///Delete
                    Container(
                      padding: EdgeInsets.only(top: 0.035 * height),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                IconData(0xe3b3, fontFamily: 'MaterialIcons'),
                                color: MyPalette.white,
                                size: 24,
                              )),

                          ///Name
                          Container(
                            padding: EdgeInsets.only(left: 0.01 * width),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Delete Account',
                              style: TextStyle(
                                fontFamily: 'Maven Pro',
                                color: Colors.white,
                                fontSize: 24,
                              ),
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
    );
  }
}

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          //set img to bg of body
          image: DecorationImage(
              image: AssetImage("assets/loginPageSmall.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 0.03 * width, top: 0.07 * height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                ///Back arrow
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          TextButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.transparent,
                            ),
                            child: Icon(
                              IconData(0xf05bc, fontFamily: 'MaterialIcons'),
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
              FittedBox(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///Preferences Title
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                                top: height * 0.01, bottom: height * 0.05),
                            child: Text(
                              'Preferences',
                              style: TextStyle(
                                fontSize: 58,
                                fontFamily: 'Share Tech',
                                color: MyPalette.lightPurple,
                              ),
                            ),
                          ),

                          Center(
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                  right: 0.03 * width, left: 0.03 * width),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ///Account
                                  Container(
                                    alignment: Alignment.center,
                                    child: TextButton(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            right: 0.03 * height),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(
                                                IconData(0xe491,
                                                    fontFamily:
                                                        'MaterialIcons'),
                                                color: MyPalette.white,
                                                size: 40,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 0.04 * width,
                                                  bottom: 0),
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Account',
                                                style: TextStyle(
                                                  fontFamily: 'Maven Pro',
                                                  color: Colors.white,
                                                  fontSize: 28,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserPage()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        foregroundColor: Colors.transparent,
                                      ),
                                    ),
                                  ),

                                  ///Change Email
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 0.04 * height),
                                    child: TextButton(
                                      child: Row(
                                        children: [
                                          ///icon
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Icon(
                                              IconData(0xe22a,
                                                  fontFamily: 'MaterialIcons'),
                                              color: MyPalette.white,
                                              size: 40,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 0.04 * width),
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Change Email',
                                              style: TextStyle(
                                                fontFamily: 'Maven Pro',
                                                color: Colors.white,
                                                fontSize: 28,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChangeEmailPage()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        foregroundColor: Colors.transparent,
                                      ),
                                    ),
                                  ),

                                  ///Change Password
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 0.04 * height),
                                    child: TextButton(
                                      child: Row(
                                        children: [
                                          ///icon
                                          Container(
                                              alignment: Alignment.topLeft,
                                              child: Icon(
                                                IconData(0xf052b,
                                                    fontFamily:
                                                        'MaterialIcons'),
                                                color: MyPalette.white,
                                                size: 40,
                                              )),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 0.04 * width),
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Change Password',
                                              style: TextStyle(
                                                fontFamily: 'Maven Pro',
                                                color: Colors.white,
                                                fontSize: 28,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChangePasswordPage()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        foregroundColor: Colors.transparent,
                                      ),
                                    ),
                                  ),

                                  ///Adjust Presets
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 0.04 * height),
                                    child: Row(
                                      children: [
                                        ///icon
                                        Container(
                                            alignment: Alignment.topLeft,
                                            child: Icon(
                                              IconData(0xe91c,
                                                  fontFamily: 'MaterialIcons'),
                                              color: MyPalette.white,
                                              size: 40,
                                            )),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 0.04 * width),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Adjust Presets',
                                            style: TextStyle(
                                              fontFamily: 'Maven Pro',
                                              color: Colors.white,
                                              fontSize: 28,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 0.04 * height),
                                    child: Row(
                                      children: [
                                        ///icon
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Icon(
                                            IconData(0xe3b3,
                                                fontFamily: 'MaterialIcons'),
                                            color: MyPalette.white,
                                            size: 40,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 0.04 * width),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Logout',
                                            style: TextStyle(
                                              fontFamily: 'Maven Pro',
                                              color: Colors.white,
                                              fontSize: 28,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  ///Delete
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 0.04 * height),
                                    child: Row(
                                      children: [
                                        ///icon
                                        Container(
                                            alignment: Alignment.topLeft,
                                            child: Icon(
                                              IconData(0xe1b9,
                                                  fontFamily: 'MaterialIcons'),
                                              color: MyPalette.white,
                                              size: 40,
                                            )),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 0.04 * width),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Delete Account',
                                            style: TextStyle(
                                              fontFamily: 'Maven Pro',
                                              color: Colors.white,
                                              fontSize: 28,
                                            ),
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

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, body: Column(children: [Body()]));
  }
}
