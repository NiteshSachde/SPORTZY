// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:sportzy/Heet/HomePage.dart';
// import 'package:sportzy/Page_Backup/loginPage.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:sportzy/Page_Backup/signUpPage.dart';
import 'Heet/HomePage.dart';
import 'Nitesh/loginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Sportzy());
}

class Sportzy extends StatefulWidget {
  const Sportzy({super.key});

  @override
  State<Sportzy> createState() => _SportzyState();
}

class _SportzyState extends State<Sportzy> {
  var auth = FirebaseAuth.instance;
  var isLogin = false;

  checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    checkIfLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogin ? HomePage() : LoginScreen(),
    );
  }
}
// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(Sportzy());
// }

// class Sportzy extends StatefulWidget {
//   const Sportzy({super.key});

//   @override
//   State<Sportzy> createState() => _SportzyState();
// }

// class _SportzyState extends State<Sportzy> {
//   // This widget is the root of your application.
//   var auth = FirebaseAuth.instance;
//   var isUser = false;

//   checkIfUser() async {
//     auth.authStateChanges().listen((User? user) {
//       if (user != null && mounted) {
//         setState(() {
//           isUser = true;
//         });
//       }
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     checkIfUser();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: isUser ? HomePage() : SignUpPage(),
//     );
//   }
// }
