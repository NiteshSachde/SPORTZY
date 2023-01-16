import 'package:flutter/material.dart';
import 'package:sportzy/Nitesh/selectSport.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Viewer',
      style: optionStyle,
    ),
    Column(
      children: <Widget>[
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 68, 167, 248),
          ),
          child: Center(
            child: Text(
              "Badminton",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: Color.fromARGB(255, 25, 100, 231),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 12),
          child: GNav(
            backgroundColor: Color.fromARGB(255, 25, 100, 231),
            color: Colors.white,
            activeColor: Color.fromARGB(255, 25, 100, 231),
            tabBackgroundColor: Colors.white,
            gap: 6,
            padding: EdgeInsets.all(16),
            iconSize: 32,
            tabs: const [
              GButton(
                icon: Icons.search,
                text: "Viewer",
                textStyle: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 25, 100, 231),
                ),
              ),
              GButton(
                icon: Icons.create,
                text: "Organizer",
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
