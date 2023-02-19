import 'package:flutter/material.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});
  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  bool _isSingle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Upcoming"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(_isSingle ? "S" : "D"),
        onPressed: () {
          setState(() {
            _isSingle = !_isSingle;
          });
        },
      ),
    );
  }
}
