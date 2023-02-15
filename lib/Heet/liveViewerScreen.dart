import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:sportzy/Nitesh/firestoreFields.dart';

class LiveViewerScreen extends StatefulWidget {
  const LiveViewerScreen({super.key});

  @override
  State<LiveViewerScreen> createState() => _LiveViewerScreenState();
}

class _LiveViewerScreenState extends State<LiveViewerScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              height: size.height,
              width: size.width,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
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
                                Icons.search,
                                color: Color.fromARGB(149, 0, 0, 0),
                              ),
                            ),
                            hintText: "Enter Event Code Or Match Name",
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
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.7),
                      height: 50,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromARGB(255, 3, 140, 252),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('sport')
                            .doc('badminton')
                            .collection('singles')
                            .snapshots(),
                        builder: (ctx, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          final matchDocs = snapshot.data!.docs;
                          print(matchDocs.length);
                          return Expanded(
                            child: ListView.builder(
                              itemCount: matchDocs.length,
                              itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "${matchDocs[index][FireStoreFields.match_name]}",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 153, 240),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "${matchDocs[index][FireStoreFields.team_A_name]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "  v/s  ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "${matchDocs[index][FireStoreFields.team_B_name]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "${matchDocs[index][FireStoreFields.team_A_player]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text("             "),
                                        Text(
                                          "${matchDocs[index][FireStoreFields.team_B_player]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "${matchDocs[index][FireStoreFields.point_team_A]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 24,
                                          ),
                                        ),
                                        Text("                      "),
                                        Text(
                                          "${matchDocs[index][FireStoreFields.point_team_B]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Set 1:   ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${matchDocs[index][FireStoreFields.team_A_set_1_points]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "  -  ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${matchDocs[index][FireStoreFields.team_B_set_1_points]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Set 2:   ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${matchDocs[index][FireStoreFields.team_A_set_2_points]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "  -  ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${matchDocs[index][FireStoreFields.team_B_set_2_points]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Set 3:   ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${matchDocs[index][FireStoreFields.team_A_set_3_points]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "  -  ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${matchDocs[index][FireStoreFields.team_B_set_3_points]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('sport')
                            .doc('badminton')
                            .collection('doubles')
                            .snapshots(),
                        builder: (ctx2, snapshot2) {
                          if (snapshot2.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          final matchDocs2 = snapshot2.data!.docs;
                          print(matchDocs2.length);
                          return Expanded(
                            child: ListView.builder(
                              itemCount: matchDocs2.length,
                              itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "${matchDocs2[index][FireStoreFields.match_name]}",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 153, 240),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "${matchDocs2[index][FireStoreFields.team_A_name]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "  v/s  ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "${matchDocs2[index][FireStoreFields.team_B_name]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "${matchDocs2[index][FireStoreFields.team_A_player1]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text("             "),
                                        Text(
                                          "${matchDocs2[index][FireStoreFields.team_B_player1]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "${matchDocs2[index][FireStoreFields.team_A_player2]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text("             "),
                                        Text(
                                          "${matchDocs2[index][FireStoreFields.team_B_player2]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "${matchDocs2[index][FireStoreFields.point_team_A]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 24,
                                          ),
                                        ),
                                        Text("                      "),
                                        Text(
                                          "${matchDocs2[index][FireStoreFields.point_team_B]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Set 1:   ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${matchDocs2[index][FireStoreFields.team_A_set_1_points]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "  -  ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${matchDocs2[index][FireStoreFields.team_B_set_1_points]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Set 2:   ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${matchDocs2[index][FireStoreFields.team_A_set_2_points]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "  -  ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${matchDocs2[index][FireStoreFields.team_B_set_2_points]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Set 3:   ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${matchDocs2[index][FireStoreFields.team_A_set_3_points]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "  -  ",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${matchDocs2[index][FireStoreFields.team_B_set_3_points]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 47, 153, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
