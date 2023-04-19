import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/CameraPage.dart';
import 'package:mood_swing/Pages/ExistingPlaylistsPage.dart';
import 'package:mood_swing/Pages/PreferencesPage.dart';
import 'package:mood_swing/Pages/UserPage.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'dart:math' as math show pi;
import '../Pages/LinkSpotifyPage.dart';
import '../Widgets/widgets.dart';

///Large Sidebar
class SidebarLarge extends StatefulWidget {
  @override
  _SidebarLargeState createState() => _SidebarLargeState();
}

class _SidebarLargeState extends State<SidebarLarge> {
  late List<CollapsibleItem> _items;
  AssetImage _avatarImg = AssetImage('assets/circleLogoSmall.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Home',
        icon: Icons.home,
        onPressed: () {},
        isSelected: true,
      ),

      ///User profile
      CollapsibleItem(
        text: 'User Profile',
        icon: const IconData(0xe491, fontFamily: 'MaterialIcons'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserPage(),
            ),
          );
        },
      ),

      ///Link to spotify
      CollapsibleItem(
        text: 'Link To Spotify',
        icon: SpotifyIcons.whiteIcon,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LinkSpotifyPage(),
            ),
          );
        },
      ),

      ///Make New Playlist
      CollapsibleItem(
        text: 'Create New Playlist',
        icon: Icons.create_rounded,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CameraPage()));
        },
      ),

      ///Existing Playlists
      CollapsibleItem(
        text: 'Existing Playlists',
        icon: const IconData(0xe4d3, fontFamily: 'MaterialIcons'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExistingPlaylistsPage(),
            ),
          );
        },
      ),

      ///User Preferences
      CollapsibleItem(
        text: 'User Preferences',
        icon: const IconData(0xec76, fontFamily: 'MaterialIcons'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PreferencesPage(),
            ),
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CollapsibleSidebar(
        isCollapsed: MediaQuery.of(context).size.width <= 800,
        items: _items,
        avatarImg: _avatarImg,
        title: 'John Smith',
        body: _body(context),
        selectedIconBox: MyPalette.magenta,
        backgroundColor: MyPalette.dark,
        selectedTextColor: MyPalette.white,
        textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        titleStyle: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        sidebarBoxShadow: [
          BoxShadow(
            color: MyPalette.brightMagenta,
            blurRadius: 20,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.green,
            blurRadius: 50,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 1,
        ),
      ),
    );
  }
}
