import 'package:flutter/material.dart';

class BottomNavbarLayout extends StatefulWidget {
  const BottomNavbarLayout({Key? key}) : super(key: key);

  @override
  State<BottomNavbarLayout> createState() => _BottomNavbarLayoutState();
}

class _BottomNavbarLayoutState extends State<BottomNavbarLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.menu),
        ),
        title: const Text('Title'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check_box_outlined),
          ),
        ],
      ),
      body: const SafeArea(
        child: Text('alksdf;alkj'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          onPressed: (){

          },
          icon: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar:BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: 'Bytes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode_outlined),
            label: 'Read',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
        // currentIndex: _selectedIndex,
        // onTap: _onItemTapped,
      ),
    );
  }
}
