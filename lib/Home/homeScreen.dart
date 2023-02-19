import 'package:flutter/material.dart';
import 'package:sportzy/Home/dashboardScreen.dart';
import 'package:sportzy/Home/Tabs/matchScreen.dart';
import 'package:sportzy/Home/profileScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _screen = <Widget>[
    DashboardScreen(),
    MatchScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
