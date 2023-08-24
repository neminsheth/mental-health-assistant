import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:ipd/profile.dart';
//import 'package:flashy_tab_bar/flashy_tab_bar.dart'; // Import the package
import 'colors.dart';
import 'feed.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    FeedPage(),
    Page(),
    Page(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Mental Health',
          style: TextStyle(color: AppColors.primary),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: FlashyTabBar( // Use FlashyTabBar
        selectedIndex: _currentIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
        }),
        backgroundColor: AppColors.secondary, // Set background color
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home, color: AppColors.white),
            title: Text('Feed', style: TextStyle(color: AppColors.white)),
            ),
          FlashyTabBarItem(
            icon: Icon(Icons.info, color: AppColors.white),
            title: Text('Info', style: TextStyle(color: AppColors.white)),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.chat, color: AppColors.white),
            title: Text('Chat', style: TextStyle(color: AppColors.white)),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.settings, color: AppColors.white),
            title: Text('Settings', style: TextStyle(color: AppColors.white)),
          ),
        ],
      ),
    );
  }
}


class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 3 Content'),
    );
  }
}
