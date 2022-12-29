// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              Color.fromARGB(255, 2, 54, 133),
              Color.fromARGB(255, 23, 107, 204),
              Color.fromARGB(255, 68, 167, 248),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
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
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
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
                            decoration: InputDecoration(
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Icon(
                                    Icons.person,
                                    color: Color.fromARGB(149, 0, 0, 0),
                                  ),
                                ),
                                hintText: "Email or Phone Number",
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
                            decoration: InputDecoration(
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Icon(
                                    Icons.lock,
                                    color: Color.fromARGB(149, 0, 0, 0),
                                  ),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Icon(
                                    Icons.visibility,
                                    color: Color.fromARGB(149, 0, 0, 0),
                                  ),
                                ),
                                hintText: "Password",
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
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.5),
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                                color: Color.fromARGB(255, 2, 54, 133),
                                fontSize: 13),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Container(
                          height: 50,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(255, 68, 167, 248),
                          ),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have account ? ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 99, 98, 98)),
                            ),
                            Text(
                              "Create an account now",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 2, 54, 133),
                              ),
                            )
                          ],
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
