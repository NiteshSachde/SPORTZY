import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.blue,
            ),
            Container(
              height: 50,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
