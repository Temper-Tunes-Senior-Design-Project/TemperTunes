import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/VerificationPage.dart';
import '../Widgets/widgets.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:mood_swing/Utilities/APIRouter.dart';

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
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BackArrowBtn(),

              ///Main Container
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 0.1 * height,
                    bottom: 0.13 * height,
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(
                          top: height * 0.03,
                          bottom: 0.03 * height,
                        ),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset(
                            "assets/spotifyLogoWhite.png",
                            scale: 2.5,
                          ),
                        ),
                      ),

                      ///Subheading
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: width * 0.02,
                            right: width * 0.02,
                            top: 0.02 * height,
                          ),
                          child: Text(
                            'Connect your Spotify account to create your personalized playlist based on your music taste.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Maven Pro',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      ///Spacer
                      SizedBox(
                        height: 0.045 * height,
                      ),

                      ///Buttons
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: BouncingWidget(
                          child: ConnectSpotify(context: context),
                          onPressed: () async {
                            APIRouter().classifySpotifyLibrary();
                          },
                        ),
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
              BackArrowBtn(),

              ///Main Container
              Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 0.15 * height),
                child: Column(
                  children: [
                    ///Logo
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(
                          top: height * 0.01, bottom: height * 0.012),
                      child: Image.asset("assets/spotifyLogoWhite.png",
                          scale: 2.3),
                    ),

                    ///spacer
                    SizedBox(height: 0.02 * height),

                    ///Subheading
                    Container(
                      padding: EdgeInsets.only(
                          left: 0.01 * width, right: 0.01 * width),
                      child: Text(
                        'Connect your Spotify account to create your personalized playlist based on your music taste.',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Maven Pro'),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    SizedBox(height: 0.08 * height),

                    ///Buttons
                    BouncingWidget(
                      child: ConnectSpotify(
                        context: context,
                      ),
                      onPressed: () async {
                        APIRouter().classifySpotifyLibrary();
                      },
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

class LinkSpotifyPage extends StatelessWidget {
  const LinkSpotifyPage({super.key});

  @override
  Widget build(Object context) {
    //Materialapp debugger false
    return Scaffold(resizeToAvoidBottomInset: false, body: Body());
  }
}

class ConnectSpotify extends StatelessWidget {
  final BuildContext context;

  const ConnectSpotify({required this.context, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      // width: 0.2 * width,
      // height: 0.075 * height,
      width: 200,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            color: MyPalette.brightMagenta,
            blurRadius: 16,
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            MyPalette.slateBlue,
            MyPalette.brightMagenta,
            MyPalette.turqoise,
          ],
        ),
      ),
      child: Flexible(
        flex: 1,
        child: ElevatedButton.icon(
          icon: Icon(
            SpotifyIcons.whiteIcon,
            color: Colors.white,
            size: 30,
          ),
          label: Text(
            'Connect Now',
            style: TextStyle(
              fontFamily: 'Share Tech',
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.transparent,
          ),
          onPressed: () async {
            APIRouter().classifySpotifyLibrary();
          },
        ),
      ),
    );
  }
}
