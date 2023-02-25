import 'package:flutter/material.dart';
import 'DoublesTT.dart';
import 'SinglesTT.dart';

class TTStandaloneScreen extends StatefulWidget {
  const TTStandaloneScreen({super.key});
  @override
  State<TTStandaloneScreen> createState() => _TTStandaloneScreenState();
}

class _TTStandaloneScreenState extends State<TTStandaloneScreen> {
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
