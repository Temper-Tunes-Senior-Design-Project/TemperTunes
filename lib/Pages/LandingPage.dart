import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import '../Widgets/ResponsiveWidget.dart';
import '../Widgets/MyPalette.dart';
import 'package:flutter/widgets.dart' as ui;


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
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: new Image.asset("music_swing_logo_med.png", height: 319, width:350 ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.0, top: 50),
            ),
            Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 70,
                          child:
                          Container(
                              color: Colors.blue,
                              height:200,
                              width: 200,
                              padding: const EdgeInsets.all(2), //space between text and pic
                              child: Row(
                                //since the layout is broken into rows
                                  children: [
                                    //Expanded makes a child of a row, column, or flex expand to fill all spaces along main axis
                                    Expanded(
                                      //Column holds only Title+Subtitle
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              //Title
                                              Container(
                                                  padding: const EdgeInsets.only(bottom: 8),
                                                  child: const Text('Mood Swing',
                                                      style: TextStyle(fontFamily: 'Share Tech', )),
                                              )
                                            ])
                                    )
                                  ])
                          )
                      )
                    ]
                )
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
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: new Image.asset("music_swing_logo_small.png", width: 250, height: 228),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.0, top: 50),
            ),
            Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 70,
                        child:
                        Container(
                          color: Colors.blue,
                          height:200,
                          width: 200,
                            padding: const EdgeInsets.all(2), //space between text and pic
                            child: Row(
                              //since the layout is broken into rows
                                children: [
                            //Expanded makes a child of a row, column, or flex expand to fill all spaces along main axis
                              Expanded(
                              //Column holds only Title+Subtitle
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      //Title
                                        Container(
                                          padding: const EdgeInsets.only(bottom: 8),
                                          child: const Text('Mood Swing',
                                                style: TextStyle(fontWeight: FontWeight.bold))),
                                  ])
                              )
                            ])
                        )
                    )
                  ]
              )
            )
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
    Widget addLogo = Container(
        padding: const EdgeInsets.all(32),
        child: new Image.asset('music_swing_logo_med.png', scale: 1)
    );

    //Materialapp debugger false
    return Scaffold(
          body: DecoratedBox(
            //BoxDecoration has image
              decoration:BoxDecoration(
                //set img to bg of body
                image: DecorationImage(
                    image: AssetImage("landingpage_bg.png"), fit: BoxFit.fill),
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
