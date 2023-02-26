import 'package:flutter/material.dart';
import 'package:sportzy/Dashboard/TT/SinglesTT.dart';
import 'DoublesTT.dart';

class StandaloneScreenTT extends StatefulWidget {
  const StandaloneScreenTT({super.key});
  @override
  State<StandaloneScreenTT> createState() => _StandaloneScreenTTState();
}

class _StandaloneScreenTTState extends State<StandaloneScreenTT> {
  List<Widget> _screen = <Widget>[
    SinglesTT(),
    DoublesTT(),
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
