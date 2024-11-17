import 'package:flutter/material.dart';
import 'package:new_project/screens/components/navbar.dart';
import 'home.dart'; // Make sure these files exist
import 'cheep_list.dart'; // Make sure these files exist
import 'profile.dart'; // Make sure these files exist

class NavigationApp extends StatefulWidget {
  const NavigationApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationAppState createState() => _NavigationAppState();
}

class _NavigationAppState extends State<NavigationApp> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    ListScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          drawer: const NavBar(),
          appBar: AppBar(
            title: const Text(
              "Cheep Helper",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            // actions: [IconButton(onPressed: null, icon: Icon(Icons.search))],
          ),
          body: _pages[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 30,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'List',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color.fromARGB(255, 244, 111, 20),
            onTap: _onItemTapped,
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
