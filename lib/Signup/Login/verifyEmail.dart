import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:sportzy/Signup/Login/loginScreen.dart';
import 'package:sportzy/Home/homeScreen.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});
  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;

  bool canResendEmail = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();

    setState(() {
      canResendEmail = false;
    });
    await Future.delayed(Duration(seconds: 50));
    setState(() {
      canResendEmail = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (isEmailVerified) {
      return HomeScreen();
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppBar(
                      leading: new IconButton(
                        icon: new Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pushReplacement(
                          (context),
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        ),
                      ),
                      backgroundColor: Colors.transparent
                          .withOpacity(0.0), //You can make this transparent
                      elevation: 0.0, //No shadow
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 25),
                      child: Text(
                        "Email Verification",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  child: Text(
                    "Welcome To Sportzy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Expanded(
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
                      child: Expanded(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                            ),
                            Text(
                              'Verification email has been sent !',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(50),
                              ),
                              icon: Icon(
                                Icons.email,
                                size: 30,
                              ),
                              label: Text(
                                'Resend Email',
                                style: TextStyle(fontSize: 22),
                              ),
                              onPressed:
                                  canResendEmail ? sendVerificationEmail : null,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            TextButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(50),
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(fontSize: 22),
                              ),
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                                Navigator.pushAndRemoveUntil(
                                  (context),
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                  (route) => false,
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
