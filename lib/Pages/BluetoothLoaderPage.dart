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
                  width: width * 0.3,
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
                    child: Flexible(
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
                                              snapshot.data?[i].name ??
                                                  "No data",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                );
                              })
                        ],
                      ),
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
                height: height * 0.16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    // StreamBuilder<List<DiscoveredDevice>>(
                    //   stream: BluetoothRouter().getNearbyDevices(),
                    //   builder: (context, snapshot) {
                    //     return Expanded(
                    //       child: Container(
                    //         height: double.minPositive,
                    //         width: double.minPositive,
                    //         child: ListView.builder(
                    //           itemCount: snapshot.data?.length ?? 0,
                    //           itemBuilder: (context, i) {
                    //             return ListTile(
                    //               title: Text(
                    //                 snapshot.data?[i].name ?? "No data",
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
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
      body: Body(),
    );
  }
}

//  Column(
//   children: [
//     Text("Found Devices"),
//     StreamBuilder<List<DiscoveredDevice>>(
//         stream: BluetoothRouter().getNearbyDevices(),
//         builder: (context, snapshot) {
//           return Container(
//             height: double.infinity,
//             color: MyPalette.darkBlue,
//             child: ListView.builder(
//                 itemCount: snapshot.data?.length ?? 0,
//                 itemBuilder: (context, i) {
//                   return ListTile(
//                     title: Text(
//                       snapshot.data?[i].name ?? "No data",
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   );
//                 }),
//           );
//         })
//   ],
// ),
