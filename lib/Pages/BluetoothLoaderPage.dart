import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import '../Widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import '../Utilities/BluetoothRouter.dart';

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
    //  final args = ModalRoute.of(context)?.settings.arguments as Map;
    final Map<dynamic, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
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
              child: FittedBox(
                child: Container(
                  height: height * 0.8,
                  width: width * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 0.01 * height, bottom: 0.01 * height),
                    height: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ///Title
                        FittedBox(
                          fit: BoxFit.scaleDown,
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
                        StreamBuilder<List<DiscoveredDevice>>(
                          stream: BluetoothRouter().getNearbyDevices(),
                          builder: (context, snapshot) {
                            return Expanded(
                              child: Container(
                                height: double.minPositive,
                                child: ListView.builder(
                                    itemCount: snapshot.data?.length ?? 0,
                                    itemBuilder: (context, i) {
                                      return ListTile(
                                        title: Text(
                                          snapshot.data?[i].name ?? "No data",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            );
                          },
                        ),
                        ContinueBtn(option: args!['option']),
                      ],
                    ),
                  ),
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
    final args = ModalRoute.of(context)?.settings.arguments as Map;

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

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.1 * width),
                      child: Subtitle(),
                    ),

                    StreamBuilder<List<DiscoveredDevice>>(
                      stream: BluetoothRouter().getNearbyDevices(),
                      builder: (context, snapshot) {
                        return Expanded(
                          child: Container(
                            height: double.minPositive,
                            width: double.minPositive,
                            child: ListView.builder(
                              itemCount: snapshot.data?.length ?? 0,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  title: Text(
                                    snapshot.data?[i].name ?? "No data",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    ContinueBtn(option: args['option']),
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

class BluetoothLoaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Column(
      //   children: [
      //     Text("Found Devices"),
      //     StreamBuilder<List<DiscoveredDevice>>(
      //         stream: BluetoothRouter().getNearbyDevices(),
      //         builder: (context, snapshot) {
      //           return Container(
      //             height: 750,
      //             child: ListView.builder(
      //                 itemCount: snapshot.data?.length ?? 0,
      //                 itemBuilder: (context, i) {
      //                   return ListTile(
      //                     title: Text(snapshot.data?[i].name ?? "No data"),
      //                     onTap: () async {
      //                       Stream<Future<String>> result =
      //                           await BluetoothRouter()
      //                               .connectToDevice(snapshot.data![i]);
      //                       result.listen((result) async {
      //                         print(await result);
      //                       });
      //                     },
      //                   );
      //                 }),
      //           );
      //         })
      //   ],
      body: Body(),
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
          left: 0.01 * width, right: 0.01 * width, top: 0.04 * height),
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.center,
        child: Text(
          "Please select the device you will use to retrieve your heartbeat and similar values",
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Maven Pro',
            color: Colors.white60,
          ),
        ),
      ),
    );
  }
}

class ContinueBtn extends StatelessWidget {
  final String option;
  ContinueBtn({required this.option});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(bottom: height * 0.3),
      child: TextButton(
        child: Container(
          width: 0.5 * width,
          height: 0.07 * height,
          decoration: BoxDecoration(
            //color: MyPalette.slateBlue,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                MyPalette.slateBlue,
                MyPalette.brightMagenta,
                MyPalette.turqoise,
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                color: MyPalette.brightMagenta,
                blurRadius: 16,
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Share Tech',
                color: Colors.white,
              ),
            ),
          ),
        ),

        ///When the user gets their readings, they can push them to the PresetsPage
        onPressed: () {
          if (option == 'UseSensorOnly') {
            Navigator.pushNamed(context, '/presets');
          } else {
            Navigator.pushNamed(context, '/compiling');
          }
        },
      ),
    );
  }
}
