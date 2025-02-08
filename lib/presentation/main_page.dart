

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flavo_rise/presentation/home/home_screen.dart';
import 'package:flavo_rise/presentation/profile/profile_screen.dart';
import 'package:flavo_rise/presentation/saved/saved_screen.dart';
import 'package:flavo_rise/presentation/search/search_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    SavedScreen(),
    ProfileScreen()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  dynamic _buildBottomNav() {
    return CustomNavigationBar(
    iconSize: 30.0,
    selectedColor: Color(0xff040307),
    strokeColor: Color(0x30040307),
    unSelectedColor: Color(0xffacacac),
    backgroundColor: Colors.white,
    items: [
      CustomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("Home"),
      ),
      CustomNavigationBarItem(
        icon: Icon(Icons.search),
        title: Text("Search"),
      ),
      CustomNavigationBarItem(
        icon: Icon(Icons.bookmark),
        title: Text("Saved"),
      ),
      CustomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        title: Text("Me"),
      ),
    ],
    currentIndex: _currentIndex,
    onTap: (index) {
      setState(() {
        _currentIndex = index;
      });
    },
  );
  }
}