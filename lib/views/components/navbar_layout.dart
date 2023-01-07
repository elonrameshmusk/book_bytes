import 'package:flutter/material.dart';
import 'package:bb/views/components/colors.dart';
import 'package:bb/views/components/shelves_widget.dart';
import 'package:bb/views/components/read_widget.dart';
import 'package:bb/views/components/profile_widget.dart';

class BottomNavbarLayout extends StatefulWidget {
  const BottomNavbarLayout({Key? key}) : super(key: key);

  @override
  State<BottomNavbarLayout> createState() => _BottomNavbarLayoutState();
}

class _BottomNavbarLayoutState extends State<BottomNavbarLayout> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ShelvesWidget(),
    ReadWidget(),
    ProfileWidget()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                  color: _selectedIndex == 0
                      ? colors['secondary_container']
                      : Colors.transparent,
                  shape: BoxShape.circle),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.format_list_bulleted),
              ),
            ),
            label: 'Bytes',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                  color: _selectedIndex == 1
                      ? colors['secondary_container']
                      : Colors.transparent,
                  shape: BoxShape.circle),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.chrome_reader_mode_outlined),
              ),
            ),
            label: 'Read',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                  color: _selectedIndex == 2
                      ? colors['secondary_container']
                      : Colors.transparent,
                  shape: BoxShape.circle),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.account_circle_outlined),
              ),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
