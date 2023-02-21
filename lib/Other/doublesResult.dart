// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sportzy/Home/homeScreen.dart';

class DoublesResult extends StatefulWidget {
  var winner, doublesDocRef;
  DoublesResult({
    Key? mykey,
    required this.winner,
    this.doublesDocRef,
  }) : super(key: mykey);
  @override
  State<DoublesResult> createState() => _DoublesResultState();
}

class _DoublesResultState extends State<DoublesResult> {
  // bool isPlaying = true;
  // final controller = ConfettiController();
  @override
  // void initState() {
  //   super.initState();
  //   controller.play();
  // }

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
                "Match Result",
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
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text(
                          "${widget.winner}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 1, 33, 211),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Text(
                          "Congratulations ${widget.winner} For Winning This Match !",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.17,
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
                                "Go To Home",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            deleteMatch();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => HomeScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // ConfettiWidget(
            //   confettiController: controller,
            //   shouldLoop: true,
            // ),
          ],
        ),
      ),
    );
  }

  deleteMatch() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('doubles')
        .doc(widget.doublesDocRef)
        .delete();
  }
}
