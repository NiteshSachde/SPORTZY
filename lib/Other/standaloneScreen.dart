import 'package:flutter/material.dart';
import 'package:sportzy/Other/doublesBadminton.dart';
import 'package:sportzy/Other/singlesBadminton.dart';

class StandaloneScreen extends StatefulWidget {
  const StandaloneScreen({super.key});
  @override
  State<StandaloneScreen> createState() => _StandaloneScreenState();
}

class _StandaloneScreenState extends State<StandaloneScreen> {
  List<Widget> _screen = <Widget>[
    SinglesBadminton(),
    DoublesBadminton(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Singles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Doubles',
          ),
        ],
      ),
    );
  }
}
