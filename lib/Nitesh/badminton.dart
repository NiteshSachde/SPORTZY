import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sportzy/Nitesh/doublesBadminton.dart';
import 'package:sportzy/Nitesh/singlesBadminton.dart';

class Badminton extends StatefulWidget {
  const Badminton({Key? key}) : super(key: key);

  @override
  State<Badminton> createState() => _Badminton();
}

class _Badminton extends State<Badminton> {
  int _selectedIndex = 0;

  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  List<Widget> _widgetOptions = <Widget>[
    SinglesBadminton(),
    DoublesBadminton(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: Color.fromARGB(255, 69, 137, 254),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
          child: GNav(
            backgroundColor: Color.fromARGB(255, 69, 137, 254),
            color: Colors.white,
            activeColor: Color.fromARGB(255, 69, 137, 254),
            tabBackgroundColor: Colors.white,
            gap: 6,
            padding: EdgeInsets.all(16),
            iconSize: 32,
            tabs: const [
              GButton(
                icon: Icons.person,
                text: "Singles",
                textStyle: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 25, 100, 231),
                ),
              ),
              GButton(
                icon: Icons.people,
                text: "Doubles",
                textStyle: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 25, 100, 231),
                ),
              )
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
