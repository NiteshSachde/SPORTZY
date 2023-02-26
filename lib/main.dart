import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportzy/Home/Tabs/homeScreen.dart';
import 'Signup/Login/loginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(Sportzy());
}

class Sportzy extends StatefulWidget {
  const Sportzy({super.key});
  @override
  State<Sportzy> createState() => _SportzyState();
}

class _SportzyState extends State<Sportzy> {
  User? user = FirebaseAuth.instance.currentUser;
  var auth = FirebaseAuth.instance;

  bool isLogin = false;
  bool isVerified = false;

  checkIfLogin() async {
    auth.authStateChanges().listen(
      (User? user) {
        if (user != null && mounted) {
          setState(() {
            isLogin = true;
          });
        }
      },
    );
  }

  checkIfVerified() async {
    if (user!.emailVerified == true) {
      setState(() {
        isVerified = true;
      });
    } else {
      setState(() {
        isVerified = false;
      });
    }
  }

  @override
  void initState() {
    checkIfLogin();
    checkIfVerified();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogin && isVerified ? HomeScreen() : LoginScreen(),
    );
  }
}
