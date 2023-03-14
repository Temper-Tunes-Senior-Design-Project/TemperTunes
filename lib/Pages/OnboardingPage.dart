import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';
import '../Widgets/widgets.dart';
import 'package:mood_swing/Pages/HomePage.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}

class LargeScreen extends StatefulWidget {
  State<LargeScreen> createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;

  ///Dot Image Status
  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: MyPalette.brightMagenta,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/appBarBG.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                  itemCount: contents.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      // padding: const EdgeInsets.all(40.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.1, vertical: 0.05 * height),
                      child: Column(
                        children: [
                          ///Image
                          Image.asset(
                            contents[i].image,
                            height: height * 0.38,
                          ),
                          SizedBox(
                            height: 0.06 * height,
                          ),

                          ///Title
                          FittedBox(
                            child: Text(
                              contents[i].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Share Tech",
                                fontWeight: FontWeight.w600,
                                color: MyPalette.lightPurple,
                                fontSize: 40,
                              ),
                            ),
                          ),

                          ///spacer
                          SizedBox(height: 0.025 * height),

                          ///Description
                          Text(
                            contents[i].desc,
                            style: TextStyle(
                              fontFamily: "Maven Pro",
                              color: Colors.white70,
                              fontWeight: FontWeight.w300,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),

              ///Dots
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (int index) => _buildDots(
                          index: index,
                        ),
                      ),
                    ),
                    _currentPage + 1 == contents.length

                        ///Continue button on last page
                        ? Padding(
                            padding: const EdgeInsets.all(30),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              },
                              child: const Text("GET STARTED"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyPalette.darkTurqoise,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: (width <= 550)
                                    ? const EdgeInsets.symmetric(
                                        horizontal: 100, vertical: 20)
                                    : EdgeInsets.symmetric(
                                        horizontal: 100, vertical: 25),
                                textStyle: TextStyle(
                                    fontSize: (width <= 550) ? 13 : 17),
                              ),
                            ),
                          )

                        ///Skip and next buttons on other pages
                        : Padding(
                            padding: const EdgeInsets.all(30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _controller.jumpToPage(2);
                                  },
                                  child: const Text(
                                    "SKIP",
                                    style: TextStyle(color: MyPalette.turqoise),
                                  ),
                                  style: TextButton.styleFrom(
                                    elevation: 0,
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: (width <= 550) ? 13 : 17,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  child: const Text("NEXT"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: MyPalette.darkMagenta,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    elevation: 0,
                                    padding: (width <= 550)
                                        ? const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 20)
                                        : const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 25),
                                    textStyle: TextStyle(
                                        fontSize: (width <= 550) ? 13 : 17),
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
      ),
    );
  }
}

class SmallScreen extends StatefulWidget {
  State<SmallScreen> createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;

  ///Dot Image Status
  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: MyPalette.brightMagenta,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/appBarBG.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                  itemCount: contents.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      // padding: const EdgeInsets.all(40.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.1, vertical: 0.05 * height),
                      child: Column(
                        children: [
                          ///Image
                          Image.asset(
                            contents[i].image,
                            height: height * 0.38,
                          ),
                          SizedBox(
                            height: 0.06 * height,
                          ),

                          ///Title
                          FittedBox(
                            child: Text(
                              contents[i].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Share Tech",
                                fontWeight: FontWeight.w600,
                                color: MyPalette.lightPurple,
                                fontSize: 40,
                              ),
                            ),
                          ),

                          ///spacer
                          SizedBox(height: 0.025 * height),

                          ///Description
                          Text(
                            contents[i].desc,
                            style: TextStyle(
                              fontFamily: "Maven Pro",
                              color: Colors.white70,
                              fontWeight: FontWeight.w300,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),

              ///Dots
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (int index) => _buildDots(
                          index: index,
                        ),
                      ),
                    ),

                    ///If we are on the last page
                    _currentPage + 1 == contents.length
                        ? Padding(
                            padding: const EdgeInsets.all(30),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              },
                              child: FittedBox(
                                child: const Text("GET STARTED"),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyPalette.darkTurqoise,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.3,
                                  vertical: 0.03 * height,
                                ),
                                textStyle: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          )

                        ///If we are not on last page (SKIP and NEXT)
                        : Padding(
                            padding: const EdgeInsets.all(30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ///Skip Button
                                TextButton(
                                  onPressed: () {
                                    _controller.jumpToPage(2);
                                  },
                                  child: const Text(
                                    "SKIP",
                                    style: TextStyle(color: MyPalette.turqoise),
                                  ),
                                  style: TextButton.styleFrom(
                                    elevation: 0,
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn,
                                    );
                                  },

                                  ///Next button
                                  child: const Text("NEXT"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: MyPalette.darkMagenta,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 20,
                                    ),
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
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

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Link to Spotify",
    image: "assets/linkIcon.png",
    desc: "Link to your Spotify account to access your music library.",
  ),
  OnboardingContents(
    title: "Set Your Preferences",
    image: "assets/preferencesIcon.png",
    desc: "Adjust the generation presets to fit your music taste.",
  ),
  OnboardingContents(
    title: "Generate Your Playlist",
    image: "assets/playlistIcon.png",
    desc: "Create your own playlist based on your mood and personal settings.",
  ),
];

// class SizeConfig {
//   static MediaQueryData? _mediaQueryData;
//   static double? screenW;
//   static double? screenH;
//   static double? blockH;
//   static double? blockV;
//
//   void init(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context);
//     screenW = _mediaQueryData!.size.width;
//     screenH = _mediaQueryData!.size.height;
//     blockH = screenW! / 100;
//     blockV = screenH! / 100;
//   }
// }
//
// class OnboardingPage extends StatefulWidget {
//   const OnboardingPage({Key? key}) : super(key: key);
//
//   @override
//   State<OnboardingPage> createState() => _OnboardingPageState();
// }
//
// class _OnboardingPageState extends State<OnboardingPage> {
//   late PageController _controller;
//
//   @override
//   void initState() {
//     _controller = PageController();
//     super.initState();
//   }
//
//   int _currentPage = 0;
//   // List colors = const [
//   //   Color(0xffDAD3C8),
//   //   Color(0xffFFE5DE),
//   //   Color(0xffDCF6E6),
//   // ];
//
//   ///Dot Image Status
//   AnimatedContainer _buildDots({
//     int? index,
//   }) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(
//           Radius.circular(50),
//         ),
//         color: MyPalette.brightMagenta,
//       ),
//       margin: const EdgeInsets.only(right: 5),
//       height: 10,
//       curve: Curves.easeIn,
//       width: _currentPage == index ? 20 : 10,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           alignment: Alignment.topCenter,
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/appBarBG.png"), fit: BoxFit.cover),
//           ),
//           child: Column(
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: PageView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   controller: _controller,
//                   onPageChanged: (value) =>
//                       setState(() => _currentPage = value),
//                   itemCount: contents.length,
//                   itemBuilder: (context, i) {
//                     return Padding(
//                       padding: const EdgeInsets.all(40.0),
//                       child: Column(
//                         children: [
//                           ///Image
//                           Image.asset(
//                             contents[i].image,
//                             height: height * 0.38,
//                           ),
//                           SizedBox(
//                             height: (height >= 840) ? 60 : 30,
//                           ),
//
//                           ///Title
//                           Text(
//                             contents[i].title,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: "Share Tech",
//                               fontWeight: FontWeight.w600,
//                               color: MyPalette.lightPurple,
//                               fontSize: (width <= 550) ? 30 : 35,
//                             ),
//                           ),
//
//                           ///spacer
//                           const SizedBox(height: 15),
//
//                           ///Description
//                           Text(
//                             contents[i].desc,
//                             style: TextStyle(
//                               fontFamily: "Maven Pro",
//                               color: Colors.white70,
//                               fontWeight: FontWeight.w300,
//                               fontSize: (width <= 550) ? 17 : 25,
//                             ),
//                             textAlign: TextAlign.center,
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//
//               ///Dots
//               Expanded(
//                 flex: 1,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: List.generate(
//                         contents.length,
//                         (int index) => _buildDots(
//                           index: index,
//                         ),
//                       ),
//                     ),
//                     _currentPage + 1 == contents.length
//
//                         ///Continue button on last page
//                         ? Padding(
//                             padding: const EdgeInsets.all(30),
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => HomePage(),
//                                   ),
//                                 );
//                               },
//                               child: const Text("GET STARTED"),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: MyPalette.slateBlue,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(50),
//                                 ),
//                                 padding: (width <= 550)
//                                     ? const EdgeInsets.symmetric(
//                                         horizontal: 100, vertical: 20)
//                                     : EdgeInsets.symmetric(
//                                         horizontal: width * 0.2, vertical: 25),
//                                 textStyle: TextStyle(
//                                     fontSize: (width <= 550) ? 13 : 17),
//                               ),
//                             ),
//                           )
//
//                         ///Skip and next buttons on other pages
//                         : Padding(
//                             padding: const EdgeInsets.all(30),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 TextButton(
//                                   onPressed: () {
//                                     _controller.jumpToPage(2);
//                                   },
//                                   child: const Text(
//                                     "SKIP",
//                                     style: TextStyle(color: MyPalette.turqoise),
//                                   ),
//                                   style: TextButton.styleFrom(
//                                     elevation: 0,
//                                     textStyle: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: (width <= 550) ? 13 : 17,
//                                     ),
//                                   ),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     _controller.nextPage(
//                                       duration:
//                                           const Duration(milliseconds: 200),
//                                       curve: Curves.easeIn,
//                                     );
//                                   },
//                                   child: const Text("NEXT"),
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: MyPalette.darkMagenta,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(50),
//                                     ),
//                                     elevation: 0,
//                                     padding: (width <= 550)
//                                         ? const EdgeInsets.symmetric(
//                                             horizontal: 30, vertical: 20)
//                                         : const EdgeInsets.symmetric(
//                                             horizontal: 30, vertical: 25),
//                                     textStyle: TextStyle(
//                                         fontSize: (width <= 550) ? 13 : 17),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
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
//
// class OnboardingContents {
//   final String title;
//   final String image;
//   final String desc;
//
//   OnboardingContents({
//     required this.title,
//     required this.image,
//     required this.desc,
//   });
// }
//
// List<OnboardingContents> contents = [
//   OnboardingContents(
//     title: "Link to Spotify",
//     image: "assets/linkIcon.png",
//     desc: "Go to User Preferences to link to your Spotify account.",
//   ),
//   OnboardingContents(
//     title: "Set Your Preferences",
//     image: "assets/preferencesIcon.png",
//     desc: "Go to User Preferences to personalize your playlist settings.",
//   ),
//   OnboardingContents(
//     title: "Generate Your Playlist",
//     image: "assets/playlistIcon.png",
//     desc: "Create your own playlist based on your mood and personal settings.",
//   ),
// ];
