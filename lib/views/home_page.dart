import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'library_page.dart';
import 'song_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  static const List<Widget> widgetOptions = <Widget>[
    SongPage(),
    Center(
      child: Text(
        'Search',
        style: optionStyle,
      ),
    ),
    LibraryPage(),
    Center(
      child: Text(
        'Hotlist',
        style: optionStyle,
      ),
    ),
  ];

  static int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: AppColors.greyColor,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: AppColors.greyColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_music_rounded,
                ),
                label: 'Library',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_fire_department,
                ),
                label: 'Hotlist',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: AppColors.blackColor,
            selectedIconTheme: const IconThemeData(color: AppColors.blackColor),
            iconSize: 24,
            selectedFontSize: 12,
            selectedLabelStyle: const TextStyle(color: AppColors.blackColor),
            onTap: _onItemTapped,
          ),
        ));
  }
}
