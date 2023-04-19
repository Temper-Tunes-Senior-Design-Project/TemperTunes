import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/userPageSmall.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            BackArrowBtn(),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    padding: EdgeInsets.only(bottom: height * 0.02),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/profilepic.png"),
                      radius: 90,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'John Doe',
              style: TextStyle(
                fontFamily: 'Share Tech',
                color: Colors.white,
                fontSize: 42,
              ),
              textAlign: TextAlign.center,
            ),

            ///Member since
            Container(
              padding: EdgeInsets.only(bottom: height * 0.02),
              child: Text(
                'Member since September 2022',
                style: TextStyle(
                  fontFamily: 'Maven Pro',
                  fontWeight: FontWeight.w300,
                  color: Colors.white54,
                  fontSize: 16,
                ),
              ),
            ),

            SizedBox(height: 0.01 * height),

            ///Container
            Container(
              width: 0.7 * width,
              height: 0.2 * height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: MyPalette.lightPurple.withOpacity(0.2),
              ),
              child: Row(
                ///Playlists
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.white70,
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: LargeUserStat(
                        context: context,
                        category: 'Playlists',
                        num: '19',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.white70,
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: LargeUserStat(
                        context: context,
                        category: 'Songs',
                        num: '80',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 0.2 * width,
                      child: LargeUserStat(
                        context: context,
                        category: 'Mood Categories',
                        num: '4',
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

class LargeUserStat extends StatelessWidget {
  final BuildContext context;
  final String category;
  final String num;
  const LargeUserStat(
      {required this.context,
      required this.category,
      required this.num,
      super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          num,
          style: TextStyle(
            fontFamily: 'Maven Pro',
            fontWeight: FontWeight.w100,
            fontSize: 60,
            color: Colors.white60,
          ),
        ),
      ),

      SizedBox(height: 10),

      ///name
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          category,
          style: TextStyle(
            fontFamily: 'Maven Pro',
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    ]);
  }
}

// class profileBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Column(
//       children: [
//         //profile picture
//         Container(
//           padding: EdgeInsets.only(top: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               //picture
//               FittedBox(
//                 fit: BoxFit.scaleDown,
//                 child: Container(
//                   padding: EdgeInsets.only(bottom: height * 0.02),
//                   child: CircleAvatar(
//                     backgroundImage: AssetImage("assets/profilepic.png"),
//                     radius: 90,
//                   ),
//                 ),
//               ),
//               //Name
//               Text(
//                 'John Doe',
//                 style: TextStyle(
//                   fontFamily: 'Share Tech',
//                   color: Colors.white,
//                   fontSize: 35,
//                 ),
//               ),
//               //Membership Duration
//               Container(
//                 padding: EdgeInsets.only(bottom: height * 0.02),
//                 child: Text(
//                   'Member since September 2022',
//                   style: TextStyle(
//                     fontFamily: 'Maven Pro',
//                     color: Colors.white,
//                     fontSize: 13,
//                   ),
//                 ),
//               ),
//               Column(
//                 children: [
//                   Container(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(15),
//                       child: Container(
//                         height: 0.12 * height,
//                         width: 0.27 * width,
//                         color: MyPalette.hanPurple,
//                         child: Row(
//                           children: [
//                             //First textbox
//                             Container(
//                               alignment: Alignment.center,
//                               width: 0.135 * width,
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     alignment: Alignment.topCenter,
//                                     padding:
//                                         EdgeInsets.only(top: 0.01 * height),
//                                     child: Text(
//                                       "Playlists Generated",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "14",
//                                     style: TextStyle(
//                                       fontSize: 32,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               alignment: Alignment.center,
//                               width: 0.135 * width,
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     alignment: Alignment.topCenter,
//                                     padding:
//                                         EdgeInsets.only(top: 0.01 * height),
//                                     child: Text(
//                                       "Unique Songs",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "173",
//                                     style: TextStyle(
//                                       fontSize: 32,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 0.02 * height),
//                   Container(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(15),
//                       child: Container(
//                         height: 0.12 * height,
//                         width: 0.27 * width,
//                         color: MyPalette.hanPurple,
//                         child: Row(
//                           children: [
//                             //First textbox
//                             Container(
//                               alignment: Alignment.center,
//                               width: 0.135 * width,
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     alignment: Alignment.topCenter,
//                                     padding:
//                                         EdgeInsets.only(top: 0.01 * height),
//                                     child: Text(
//                                       "Mood Categories",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 15),
//                                     ),
//                                   ),
//                                   Text(
//                                     "7",
//                                     style: TextStyle(
//                                       fontSize: 32,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               alignment: Alignment.center,
//                               width: 0.135 * width,
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     alignment: Alignment.topCenter,
//                                     padding:
//                                         EdgeInsets.only(top: 0.01 * height),
//                                     child: Text(
//                                       "Exported Playlists",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "3",
//                                     style: TextStyle(
//                                       fontSize: 32,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class LargeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return SingleChildScrollView(
//       child: SafeArea(
//         child: Container(
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/userPageSmall.png"),
//                 fit: BoxFit.cover),
//           ),
//           child: Column(
//             children: [
//               BackArrowBtn(),
//               Padding(
//                 padding: EdgeInsets.only(left: 50, right: width * 0.02),
//                 child: Row(
//                   children: <Widget>[
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Container(
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ///profileBar
//                             Container(
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(30),
//                                 child: Container(
//                                   width: width * 0.3,
//                                   height: height * 0.7,
//                                   color: MyPalette.darkTurqoise,
//                                   child: profileBar(),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: width * 0.04), //separator
//                             Column(
//                               children: [
//                                 //Linked Devices
//                                 Container(
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(30),
//                                     child: Container(
//                                       padding: EdgeInsets.only(
//                                           top: 0.01 * height, left: 0),
//                                       width: width * 0.55,
//                                       height: height * 0.32,
//                                       color: MyPalette.magenta,
//                                       child: Column(
//                                         children: [
//                                           FittedBox(
//                                             child: Text(
//                                               "Linked Devices",
//                                               style: TextStyle(
//                                                 fontFamily: 'Share Tech',
//                                                 color: Colors.white,
//                                                 fontSize: 30,
//                                               ),
//                                             ),
//                                           ),
//                                           Divider(
//                                             color: Colors.white,
//                                             height: height * 0.01,
//                                           ),
//                                           //list of devices
//                                           Container(
//                                             alignment: Alignment.centerLeft,
//                                             child: Column(
//                                               children: [
//                                                 SizedBox(
//                                                   height: height * 0.24,
//                                                   child: Container(
//                                                     height: 0.3 * height,
//                                                     width: 0.15 * width,
//                                                     margin: EdgeInsets.only(
//                                                         left: 0.02 * width,
//                                                         top: 0.01 * width),
//                                                     child: Container(
//                                                       height: 0.5 * height,
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius.all(
//                                                           Radius.circular(10),
//                                                         ),
//                                                         color: MyPalette.dark
//                                                             .withOpacity(0.2),
//                                                       ),
//                                                       child: Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .center,
//                                                         children: [
//                                                           //Watch icon
//                                                           Container(
//                                                             padding:
//                                                                 EdgeInsets.only(
//                                                                     top: 0.02 *
//                                                                         height),
//                                                             child: Icon(
//                                                               IconData(0xf4b2,
//                                                                   fontFamily:
//                                                                       'MaterialIcons'),
//                                                               color: MyPalette
//                                                                   .white,
//                                                               size: 70,
//                                                             ),
//                                                           ),
//                                                           //Device Descr.
//                                                           Container(
//                                                             padding:
//                                                                 EdgeInsets.only(
//                                                                     top: 0.03 *
//                                                                         height),
//                                                             child: Text(
//                                                               "John Doe's FitBit",
//                                                               style: TextStyle(
//                                                                 fontFamily:
//                                                                     'Maven Pro',
//                                                                 color: Colors
//                                                                     .white,
//                                                                 fontSize:
//                                                                     17, //  fontWeight: FontWeight.bold,
//                                                               ),
//                                                               textAlign:
//                                                                   TextAlign
//                                                                       .center,
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: height * 0.05),
//                                 ////Separator
//                                 //Linked Accounts:
//                                 Container(
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(30),
//                                     child: Container(
//                                       padding: EdgeInsets.only(
//                                           left: 0, top: 0.01 * height),
//                                       width: width * 0.55,
//                                       height: height * 0.32,
//                                       color: MyPalette.magenta,
//                                       child: Column(
//                                         children: [
//                                           Text(
//                                             "Linked Accounts",
//                                             style: TextStyle(
//                                               fontFamily: 'Share Tech',
//                                               color: Colors.white,
//                                               fontSize: 30,
//                                             ),
//                                           ),
//                                           Divider(
//                                             color: Colors.white,
//                                             height: height * 0.01,
//                                           ),
//                                           Container(
//                                             alignment: Alignment.bottomLeft,
//                                             child: Column(
//                                               children: <Widget>[
//                                                 Row(
//                                                   children: [
//                                                     SizedBox(
//                                                       height: height * 0.24,
//                                                       child: Container(
//                                                         height: 0.3 * height,
//                                                         width: 0.15 * width,
//                                                         margin: EdgeInsets.only(
//                                                             left: 0.02 * width,
//                                                             top: 0.01 * width),
//                                                         child: Container(
//                                                           height: 0.5 * height,
//                                                           decoration:
//                                                               BoxDecoration(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(
//                                                               Radius.circular(
//                                                                   10),
//                                                             ),
//                                                             color: MyPalette
//                                                                 .dark
//                                                                 .withOpacity(
//                                                                     0.2),
//                                                           ),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .center,
//                                                             children: [
//                                                               //Watch icon
//                                                               Container(
//                                                                 padding: EdgeInsets.only(
//                                                                     top: 0.01 *
//                                                                         height),
//                                                                 child: Image.asset(
//                                                                     "assets/spotifyLogo.png",
//                                                                     height: 0.1 *
//                                                                         height,
//                                                                     width: 0.11 *
//                                                                         width),
//                                                               ),
//                                                               //Device Descr.
//                                                               Container(
//                                                                 padding: EdgeInsets.only(
//                                                                     top: 0.02 *
//                                                                         height),
//                                                                 child: Text(
//                                                                   "Spotify",
//                                                                   style:
//                                                                       TextStyle(
//                                                                     fontFamily:
//                                                                         'Maven Pro',
//                                                                     color: Colors
//                                                                         .white,
//                                                                     fontSize:
//                                                                         17,
//                                                                   ),
//                                                                   textAlign:
//                                                                       TextAlign
//                                                                           .center,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                         width: 0.005 * width),
//                                                     SizedBox(
//                                                       height: height * 0.24,
//                                                       child: Container(
//                                                         height: 0.3 * height,
//                                                         width: 0.15 * width,
//                                                         margin: EdgeInsets.only(
//                                                           left: 0.02 * width,
//                                                           top: 0.01 * width,
//                                                         ),
//                                                         child: Container(
//                                                           height: 0.5 * height,
//                                                           decoration:
//                                                               BoxDecoration(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(
//                                                               Radius.circular(
//                                                                   10),
//                                                             ),
//                                                             color: MyPalette
//                                                                 .dark
//                                                                 .withOpacity(
//                                                                     0.2),
//                                                           ),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .center,
//                                                             children: [
//                                                               //Watch icon
//                                                               Container(
//                                                                 padding: EdgeInsets.only(
//                                                                     top: 0.01 *
//                                                                         height),
//                                                                 child: Image.asset(
//                                                                     "assets/appleMusicLogo.png",
//                                                                     height: 0.12 *
//                                                                         height,
//                                                                     width: width *
//                                                                         0.11),
//                                                               ),
//                                                               //Device Descr.
//                                                               Container(
//                                                                 padding: EdgeInsets.only(
//                                                                     top: 0.02 *
//                                                                         height),
//                                                                 child: Text(
//                                                                   "Apple Music",
//                                                                   style:
//                                                                       TextStyle(
//                                                                     fontFamily:
//                                                                         'Maven Pro',
//                                                                     color: Colors
//                                                                         .white,
//                                                                     fontSize:
//                                                                         17,
//                                                                   ),
//                                                                   textAlign:
//                                                                       TextAlign
//                                                                           .center,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
                image: AssetImage("assets/userPageSmall.png"),
                fit: BoxFit.cover),
          ),
          child: Container(
            child: Column(
              children: <Widget>[
                BackArrowBtn(),
                SizedBox(
                  height: 0.03 * height,
                ),

                ///top container
                Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      height: height * 0.25,
                      width: width,
                      decoration: BoxDecoration(
                        // image: DecorationImage(
                        //     image: AssetImage("assets/profileBackdrop.png"),
                        //     fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent],
                          ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height));
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image.asset(
                          'assets/profileBackdrop.png',
                          height: 500,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          ///Profile picture
                          Container(
                            padding: EdgeInsets.only(top: height * 0.03),
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/profilepic.png"),
                              radius: 60,
                            ),
                          ),
                          //User's name and membership
                          Container(
                            padding: EdgeInsets.only(top: height * 0.03),
                            child: Column(
                              children: [
                                //Name
                                Text(
                                  "John Doe",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Share Tech',
                                    fontSize: 40,
                                  ),
                                ),
                                //Membership
                                Container(
                                  padding: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Member since September 2022",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white54,
                                      fontFamily: 'Maven Pro',
                                      fontSize: 16,
                                    ),
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

                SizedBox(
                  height: 0.05 * height,
                ),

                Container(
                  width: 0.8 * width,
                  height: 0.15 * height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyPalette.lightPurple.withOpacity(0.2),
                  ),
                  child: Row(
                    ///Playlists
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.white70,
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: SmallUserStat(
                            context: context,
                            category: 'Playlists',
                            num: '19',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.white70,
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: SmallUserStat(
                            context: context,
                            category: 'Songs',
                            num: '80',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: SmallUserStat(
                            context: context,
                            category: 'Categories',
                            num: '4',
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
      ),
    );
  }
}

class SmallUserStat extends StatelessWidget {
  final BuildContext context;
  final String category;
  final String num;
  const SmallUserStat(
      {required this.context,
      required this.category,
      required this.num,
      super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          num,
          style: TextStyle(
            fontFamily: 'Maven Pro',
            fontWeight: FontWeight.w100,
            fontSize: 33,
            color: Colors.white60,
          ),
          textAlign: TextAlign.center,
        ),
      ),

      SizedBox(height: 10),

      ///name
      Container(
        padding: EdgeInsets.only(left: 0.03 * width, right: 0.03 * width),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            category,
            style: TextStyle(
              fontFamily: 'Maven Pro',
              fontWeight: FontWeight.w400,
              fontSize: 17,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ]);
  }
}

class UserPage extends StatelessWidget {
  static const Key PageKey = Key("User Page");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: PageKey,
      body: Body(),
    );
  }
}
