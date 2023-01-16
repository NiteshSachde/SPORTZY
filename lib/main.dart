import 'package:flutter/material.dart';
import 'package:sportzy/Heet/HomePage.dart';
import 'package:sportzy/Nitesh/loginPage.dart';
import 'package:sportzy/Nitesh/signUpPage.dart';
// import './SelectOption.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      home: LoginPage(),
    );
  }
}
