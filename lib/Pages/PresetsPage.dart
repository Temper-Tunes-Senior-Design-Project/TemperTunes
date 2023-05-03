import 'package:carousel_slider/carousel_slider.dart';
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
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: LargeCarousel(),
    );
  }
}

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SmallCarousel(),
    );
  }
}

class SmallCarousel extends StatefulWidget {
  const SmallCarousel({Key? key}) : super(key: key);

  @override
  _SmallCarouselState createState() => _SmallCarouselState();
}

class _SmallCarouselState extends State<SmallCarousel> {
  // int _current = 0;
  dynamic _selectedIndex = {};

  final CarouselController _carouselController = CarouselController();

  final List<dynamic> _products = [
    {'title': 'Angry', 'image': 'assets/angry.png'},
    {'title': 'Calm', 'image': 'assets/calm.png'},
    {
      'title': 'Content',
      'image': 'assets/content.png',
    },
    {
      'title': 'Depressed',
      'image': 'assets/depressed.png',
    },
    {
      'title': 'Energetic',
      'image': 'assets/energetic.png',
    },
    {
      'title': 'Excited',
      'image': 'assets/excited.png',
    },
    {'title': 'Happy', 'image': 'assets/happy.png'},
    {'title': 'Sad', 'image': 'assets/sad.png'},
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/userPageSmall.png"),
                fit: BoxFit.cover),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BackArrowBtn(),
            SizedBox(height: 10),
            Title(),
            Subtitle(),
          ],
        ),
        Container(
          // width: double.infinity,
          // height: double.infinity,
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 80, top: 30),
          child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                  height: height * 0.41,
                  viewportFraction: 0.5,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      // _current = index;
                      //print(index);
                    });
                  }),
              items: _products.map((mood) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedIndex == mood) {
                            _selectedIndex = {};
                          } else {
                            _selectedIndex = mood;
                            Navigator.pushNamed(context, '/compiling');
                          }
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                MyPalette.slateBlue,
                                MyPalette.brightMagenta,
                                MyPalette.slateBlue,
                                MyPalette.turqoise,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: _selectedIndex == mood
                                ? Border.all(
                                    color: MyPalette.lightPurple, width: 3)
                                : null,
                            boxShadow: _selectedIndex == mood
                                ? [
                                    BoxShadow(
                                      color: MyPalette.hanPurple,
                                      blurRadius: 30,
                                      offset: Offset(0, 1),
                                    ),
                                  ]
                                : [
                                    BoxShadow(
                                      color: MyPalette.brightMagenta,
                                      blurRadius: 20,
                                      offset: Offset(0, 5),
                                    ),
                                  ]),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Container(
                                  height: 0.3 * height,
                                  margin: const EdgeInsets.all(10),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.network(mood['image'],
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  mood['title'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Maven Pro',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList()),
        ),
      ],
    ));
  }
}

class LargeCarousel extends StatefulWidget {
  const LargeCarousel({Key? key}) : super(key: key);

  @override
  _LargeCarouselState createState() => _LargeCarouselState();
}

class _LargeCarouselState extends State<LargeCarousel> {
  // int _current = 0;
  dynamic _selectedIndex = {};
  final CarouselController _carouselController = CarouselController();
  final List<dynamic> _products = [
    {'title': 'Angry', 'image': 'assets/angry.png'},
    {'title': 'Calm', 'image': 'assets/calm.png'},
    {
      'title': 'Content',
      'image': 'assets/content.png',
    },
    {
      'title': 'Depressed',
      'image': 'assets/depressed.png',
    },
    {
      'title': 'Energetic',
      'image': 'assets/energetic.png',
    },
    {
      'title': 'Excited',
      'image': 'assets/excited.png',
    },
    {'title': 'Happy', 'image': 'assets/happy.png'},
    {'title': 'Sad', 'image': 'assets/sad.png'},
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/LandingPageBG.png"),
                fit: BoxFit.cover),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BackArrowBtn(),
            SizedBox(height: 10),
            Title(),
            Subtitle(),
          ],
        ),
        BackArrowBtn(),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 80),
          child: CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
                height: height * 0.43,
                aspectRatio: 16 / 9,
                viewportFraction: 0.3,
                enlargeFactor: 0.2,
                enlargeCenterPage: true,
                pageSnapping: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    // _current = index;
                    //print(index);
                  });
                }),
            items: _products.map(
              (mood) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedIndex == mood) {
                            _selectedIndex = {};
                          } else {
                            _selectedIndex = mood;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NextPage(selectedMood: mood['title']),
                              ),
                            );
                          }
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                MyPalette.slateBlue,
                                MyPalette.brightMagenta,
                                MyPalette.slateBlue,
                                MyPalette.turqoise,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: _selectedIndex == mood
                                ? Border.all(
                                    color: MyPalette.lightPurple, width: 3)
                                : null,
                            boxShadow: _selectedIndex == mood
                                ? [
                                    BoxShadow(
                                        color: Colors.blue.shade100,
                                        blurRadius: 30,
                                        offset: Offset(0, 10))
                                  ]
                                : [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 20,
                                      offset: Offset(0, 5),
                                    )
                                  ]),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Container(
                                  height: 0.3 * height,
                                  margin: const EdgeInsets.all(10),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.network(mood['image'],
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                mood['title'],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ).toList(),
          ),
        ),
      ],
    ));
  }
}

class Title extends StatelessWidget {
  const Title({super.key});
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        'Mood Selection',
        style: TextStyle(
          fontSize: 54,
          fontFamily: 'Share Tech',
          color: MyPalette.lightPurple,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Subtitle extends StatelessWidget {
  const Subtitle({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return FittedBox(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.only(left: 0.05 * width, right: 0.05 * width),
        child: Text(
          'Please select the option that best fits your mood',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Maven Pro',
            fontWeight: FontWeight.w400,
            color: Colors.white60,
          ),
        ),
      ),
    );
  }
}

class PresetsPage extends StatelessWidget {
  const PresetsPage({super.key});

  @override
  Widget build(Object context) {
    //Materialapp debugger false
    return SafeArea(
      child: Body(),
    );
  }
}

class NextPage extends StatelessWidget {
  final String selectedMood;

  const NextPage({Key? key, required this.selectedMood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selected Mood')),
      body: Center(
        child: Text(selectedMood),
      ),
    );
  }
}
