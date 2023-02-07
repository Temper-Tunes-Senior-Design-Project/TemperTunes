import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import '../Widgets/widgets.dart';
//import 'package:flutter/widgets.dart' as ui;


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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top:30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: new Image.asset("music_swing_logo_med.png", width: 360, height: 413),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.0, top: 0),
            ),
            Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height:200,
                          child:
                          Container(
                              //color: Colors.blue,
                              padding: const EdgeInsets.all(0), //space between text and pic
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
                                                  child: const Text('Mood Swing',
                                                      style: TextStyle(
                                                        fontFamily: 'Share Tech',
                                                        color: MyPalette.lightPurple,
                                                        fontSize: 65),
                                                      textAlign: TextAlign.center,
                                                      )
                                              ),
                                              //SUBTITLE
                                              const Text( 'Click to begin',
                                                style: TextStyle(
                                                    fontFamily: 'Maven Pro',
                                                    color: MyPalette.white,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                              ),
                                              //ICON
                                              Container(
                                                padding: const EdgeInsets.only(top: 20),
                                                child: Icon(
                                                  IconData(0xe353, fontFamily: 'MaterialIcons'),
                                                  color: MyPalette.white,
                                                  size: 60,
                                                ),
                                              )
                                        ]),
                                    )
                                  ])
                          )
                      )
                ])
            )
          ],
        ),
      ),
    );
  }
}


    /*
    return Container(
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [addLogo()],
      ),
    );
*/

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: new Image.asset("music_swing_logo_small.png", width: 370, height: 338),
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
                        child:
                        Container(
                          //  color: Colors.blue,
                            padding: const EdgeInsets.all(0), //space between text and pic
                            child: Row(
                              //since the layout is broken into rows
                              children: [
                            //Expanded makes a child of a row, column, or flex expand to fill all spaces along main axis
                              Expanded(
                              //Column holds only Title+Subtitle
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                      //Title
                                        Container(
                                          padding: const EdgeInsets.only(bottom: 5),
                                          child: const Text('Mood Swing',
                                              style: TextStyle(
                                                fontFamily: 'Share Tech',
                                                color: MyPalette.lightPurple,
                                                fontSize: 55,),
                                              textAlign: TextAlign.center
                                          ),
                                        ),
                                    const Text( 'Swipe to begin',
                                      style: TextStyle(
                                        fontFamily: 'Maven Pro',
                                        color: MyPalette.white,
                                        fontSize: 18),
                                      textAlign: TextAlign.center,
                                      ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Icon(
                                          IconData(0xe043, fontFamily: 'MaterialIcons'),
                                          color: MyPalette.white,
                                          size: 36,
                                      ),
                                    )]
                                  )
                                )
                              ])
                            )
                          )
                        ])
                      )
                    ]
                  )
              )
            );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(Object context) {
    Widget addLogo = Container(
        padding: const EdgeInsets.all(32),
        child: new Image.asset('music_swing_logo_med.png', scale: 1)
    );

    //Materialapp debugger false
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: DecoratedBox(
            //BoxDecoration has image
              decoration:BoxDecoration(
                //set img to bg of body
                image: DecorationImage(
                    image: AssetImage("landingpageBG.png"), fit: BoxFit.cover),
              ),
              child: Column(
                  children: [Body()]
              )
          )
    );
  }
}


/*

runApp(
          new MediaQuery(
              data: new MediaQueryData.fromWindow(ui.window),
              child: new Directionality(
                  textDirection: TextDirection.rtl,
                  child: new LandingPage()))
  );

var background = "landingpage_bg.png";

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
    return Column(
      children: [
        Stack(
        fit: StackFit.loose,
        children: <Widget>[addBackground()],
      ),]
    );
  }

  //Adds background Image
  Widget addBackground() {
    return FractionallySizedBox(
      alignment: Alignment.centerRight, //to keep images aligned to right
      widthFactor: 1, //covers about 60% of the screen width
      heightFactor: 0.5,
      child: new Image.asset(background,fit: BoxFit.cover)
    );
  }
}


class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: new Image.asset(background, scale: 1),
            ),
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
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints){
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Body()
                      ]
                  )
              )
          );
        }
    );
  }
}


*/
