import 'package:flutter/material.dart';
import 'package:mood_swing/Pages/PreferencesPage.dart';
import 'package:mood_swing/Pages/UserPage.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'dart:math' as math show pi;

///Large Sidebar
class SidebarLarge extends StatefulWidget {
  @override
  _SidebarLargeState createState() => _SidebarLargeState();
}

class _SidebarLargeState extends State<SidebarLarge> {
  late List<CollapsibleItem> _items;
  AssetImage _avatarImg = AssetImage('assets/music_swing_logo_small.png');

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
        icon: IconData(0xe491, fontFamily: 'MaterialIcons'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserPage(),
            ),
          );
        },
      ),

      ///Make New Playlist
      CollapsibleItem(
        text: 'Create New Playlist',
        icon: Icons.create_rounded,
        onPressed: () {},
      ),

      ///Existing Playlists
      CollapsibleItem(
        text: 'Existing Playlists',
        icon: IconData(0xe4d3, fontFamily: 'MaterialIcons'),
        onPressed: () {},
      ),

      ///User Preferences
      CollapsibleItem(
        text: 'User Preferences',
        icon: IconData(0xec76, fontFamily: 'MaterialIcons'),
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
        onTitleTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
        },
        body: _body(context),
        backgroundColor: Colors.black,
        selectedTextColor: Colors.limeAccent,
        textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        titleStyle: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        sidebarBoxShadow: [
          BoxShadow(
            color: Colors.indigo,
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
      width: 700,
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 1,
        ),
      ),
    );
  }
}
