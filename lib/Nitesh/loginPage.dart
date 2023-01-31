// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportzy/Nitesh/verifyOtp.dart';
import './signUpPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var phone = "";
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  child: Text(
                    "Get Started !",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: Text(
                "Welcome To Sportzy",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Expanded(
              child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/Sportzy_Blue_Final_Transparent.png',
                              width: 150,
                              height: 150,
                            ),
                            Text(
                              " Sportzy",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 7,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.3)),
                            ],
                          ),
                          child: TextField(
                            onChanged: (value) {
                              phone = value;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Icon(
                                    Icons.phone,
                                    color: Color.fromARGB(149, 0, 0, 0),
                                  ),
                                ),
                                hintText: "Phone Number",
                                hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(30),
                        //     color: Colors.white,
                        //     boxShadow: [
                        //       BoxShadow(
                        //           blurRadius: 10,
                        //           spreadRadius: 7,
                        //           offset: Offset(1, 1),
                        //           color: Colors.grey.withOpacity(0.3)),
                        //     ],
                        //   ),
                        //   child: TextField(
                        //     obscureText: passwordObscured,
                        //     decoration: InputDecoration(
                        //         icon: Padding(
                        //           padding: const EdgeInsets.only(left: 20),
                        //           child: Icon(
                        //             Icons.lock,
                        //             color: Color.fromARGB(149, 0, 0, 0),
                        //           ),
                        //         ),
                        //         suffixIcon: Padding(
                        //           padding: const EdgeInsets.only(right: 25),
                        //           child: IconButton(
                        //             onPressed: () {
                        //               setState(() {
                        //                 passwordObscured = !passwordObscured;
                        //               });
                        //             },
                        //             icon: Icon(
                        //               passwordObscured
                        //                   ? Icons.visibility_off
                        //                   : Icons.visibility,
                        //             ),
                        //             color: Color.fromARGB(149, 0, 0, 0),
                        //           ),
                        //         ),
                        //         hintText: "Password",
                        //         hintStyle: TextStyle(color: Colors.grey),
                        //         focusedBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(30),
                        //             borderSide: BorderSide(
                        //                 color: Colors.white, width: 1.0)),
                        //         enabledBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(30),
                        //             borderSide: BorderSide(
                        //                 color: Colors.white, width: 1.0)),
                        //         border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(30))),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.04,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(
                        //       left: MediaQuery.of(context).size.width * 0.5),
                        //   child: Text(
                        //     "Forgot Password ?",
                        //     style: TextStyle(
                        //         color: Color.fromARGB(255, 2, 54, 133),
                        //         fontSize: 13),
                        //   ),
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromARGB(255, 68, 167, 248),
                            ),
                            child: Center(
                              child: Text(
                                "Send OTP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onTap: (() async {
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: '+91${phone}',
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                SignUpPage.verify = verificationId;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VerifyOtp()));
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
                          }),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       "Don't have account ? ",
                        //       style: TextStyle(
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.bold,
                        //           color: Color.fromARGB(255, 99, 98, 98)),
                        //     ),
                        //     GestureDetector(
                        //       child: Text(
                        //         "Create an account now",
                        //         style: TextStyle(
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.bold,
                        //           color: Color.fromARGB(255, 2, 54, 133),
                        //         ),
                        //       ),
                        //       onTap: (() {
                        //         Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) => SignUpPage()));
                        //       }),
                        //     )
                        //   ],
                        // ),
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
