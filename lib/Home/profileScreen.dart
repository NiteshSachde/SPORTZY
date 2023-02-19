import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportzy/Signup/Login/loginScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 17, 71, 234),
              Color.fromARGB(255, 50, 115, 228),
              Color.fromARGB(255, 88, 192, 233),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.11,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
              child: Text(
                "User Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromARGB(255, 15, 136, 236),
                            ),
                            child: Center(
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onTap: () => logOut(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
