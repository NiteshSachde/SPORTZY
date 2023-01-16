import 'package:flutter/material.dart';
import 'package:sportzy/Nitesh/selectSport.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ),
        ),
      ),
    );
  }
}
