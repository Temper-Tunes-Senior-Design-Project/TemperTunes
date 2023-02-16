import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/HomePage.dart';
import 'package:mood_swing/Pages/PreferencesPage.dart';
import 'package:mood_swing/Pages/UserPage.dart';

import '../Widgets/widgets.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:flutter/cupertino.dart';

import 'package:mood_swing/main.dart';



///Small Sidebar

class SidebarSmall extends StatelessWidget {
  SidebarSmall ({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SidebarX Example',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: primaryColor,
      //   canvasColor: canvasColor,
      //   scaffoldBackgroundColor: Colors.orange,
      //   textTheme: const TextTheme(
      //     headlineSmall: TextStyle(
      //       color: Colors.white,
      //       fontSize: 46,
      //       fontWeight: FontWeight.w800,
      //     ),
      //   ),
      // ),
      home: Builder(
        builder: (context) {
          return Scaffold(
            key: _key,
            floatingActionButton: IconButton(
              onPressed: () {
                // if (!Platform.isAndroid && !Platform.isIOS) {
                //   _controller.setExtended(true);
                // }
                _key.currentState?.openDrawer();
              },
              icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 35,),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,

            drawer: SidebarDrawer(controller: _controller),
            body: Row(
              children: [
                ///tiles
                Expanded(
                  child: Center(
                    child: HomePage(
                 ///     controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SidebarDrawer extends StatelessWidget {
  const SidebarDrawer({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: MyPalette.turqoise,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [MyPalette.turqoise, MyPalette.lightPurple, MyPalette.magenta],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 205,
        decoration: BoxDecoration(
          color: MyPalette.dark,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return Container(
           height: height*0.28,
           child: Padding(
             padding: EdgeInsets.only(top: 0.1*height, right: 0.05*width),
             child: Image.asset('assets/music_swing_logo_small.png'),
            ),

        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {
            debugPrint('Home');
          },
        ),
        ///User Profile
         SidebarXItem(
          icon: IconData(0xe491, fontFamily: 'MaterialIcons'),
          label: 'User Profile',
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage()));},
         ),

        ///Make New Playlist
         SidebarXItem(
          icon: Icons.create_rounded,
          label: 'Create New Playlist',
        ),

        ///Existing Playlists
         SidebarXItem(
          icon: IconData(0xe4d3, fontFamily: 'MaterialIcons'),
          label: 'Existing Playlists',
        ),

        ///Settings/Preferences
         SidebarXItem(
          icon: IconData(0xec76, fontFamily: 'MaterialIcons'),
          label: 'User Preferences',
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PreferencesPage()));},
        ),

        ///IconWidget
        const SidebarXItem(
          iconWidget: FlutterLogo(size: 20),
          label: 'Flutter',
        ),
      ],
    );
  }
}

/*
class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
   final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final navigateTo = (page) => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,),);
        switch (controller.selectedIndex) {
          case 0:
            navigateTo(HomePage());
            break;


        }
      },
    );
  }
}
*/

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

