import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Others/firestoreFields.dart';

class MyCanceledMatchesScreen extends StatefulWidget {
  const MyCanceledMatchesScreen({super.key});
  @override
  State<MyCanceledMatchesScreen> createState() =>
      _MyCanceledMatchesScreenState();
}

class _MyCanceledMatchesScreenState extends State<MyCanceledMatchesScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final _auth = FirebaseAuth.instance;
  bool _isSingle = true;

  @override
  void initState() {
    _tabController = new TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    height: 50,
                    child: Text(
                      "Badminton",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Tab(
                    height: 50,
                    child: Text(
                      "Table Tennis",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    StreamBuilder(
                      stream: _isSingle
                          ? FirebaseFirestore.instance
                              .collection('sport')
                              .doc('badminton')
                              .collection('canceled_singles')
                              .where("createdBy",
                                  isEqualTo: _auth.currentUser!.uid)
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection('sport')
                              .doc('badminton')
                              .collection('canceled_doubles')
                              .where("createdBy",
                                  isEqualTo: _auth.currentUser!.uid)
                              .snapshots(),
                      builder: (ctx2, snapshot2) {
                        if (snapshot2.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final matchDocs = snapshot2.data!.docs;
                        return Expanded(
                          child: ListView.builder(
                            itemCount: snapshot2.data!.docs.length,
                            itemBuilder: (ctx, index) {
                              return _isSingle
                                  ? Container(
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 47, 153, 240),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              "${matchDocs[index][FireStoreFields.match_name]}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            "Match Date : ${matchDocs[index][FireStoreFields.date]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
                                          ),
                                          Text(
                                            "Location : ${matchDocs[index][FireStoreFields.location]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
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
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                              Text(
                                                "v/s",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                              Text(
                                                "${matchDocs[index][FireStoreFields.team_B_name]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
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
                                                  fontSize: 18,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                              ),
                                              Text(
                                                "${matchDocs[index][FireStoreFields.team_B_player]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 2, 154, 90),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Set 1 :",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_A_set_1_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "-",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_B_set_1_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Set 2 :",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_A_set_2_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "-",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_B_set_2_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Set 3 :",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_A_set_3_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "-",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_B_set_3_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            "Match has been canceled !!",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 47, 153, 240),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              "${matchDocs[index][FireStoreFields.match_name]}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            "Match Date : ${matchDocs[index][FireStoreFields.date]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
                                          ),
                                          Text(
                                            "Location : ${matchDocs[index][FireStoreFields.location]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
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
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                              Text(
                                                "v/s",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                              Text(
                                                "${matchDocs[index][FireStoreFields.team_B_name]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "${matchDocs[index][FireStoreFields.team_A_player1]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 18,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                              ),
                                              Text(
                                                "${matchDocs[index][FireStoreFields.team_B_player1]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "${matchDocs[index][FireStoreFields.team_A_player2]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 18,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                              ),
                                              Text(
                                                "${matchDocs[index][FireStoreFields.team_B_player2]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 2, 154, 90),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Set 1 :",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_A_set_1_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "-",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_B_set_1_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Set 2 :",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_A_set_2_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "-",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_B_set_2_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Set 3 :",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_A_set_3_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "-",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_B_set_3_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            "Match has been canceled !!",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                            },
                          ),
                        );
                      },
                    ),
                    StreamBuilder(
                      stream: _isSingle
                          ? FirebaseFirestore.instance
                              .collection('sport')
                              .doc('TT')
                              .collection('canceled_singles')
                              .where("createdBy",
                                  isEqualTo: _auth.currentUser!.uid)
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection('sport')
                              .doc('TT')
                              .collection('canceled_doubles')
                              .where("createdBy",
                                  isEqualTo: _auth.currentUser!.uid)
                              .snapshots(),
                      builder: (ctx2, snapshot2) {
                        if (snapshot2.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final matchDocs = snapshot2.data!.docs;
                        return Expanded(
                          child: ListView.builder(
                            itemCount: snapshot2.data!.docs.length,
                            itemBuilder: (ctx, index) {
                              return _isSingle
                                  ? Container(
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 47, 153, 240),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              "${matchDocs[index][FireStoreFields.match_name]}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            "Match Date : ${matchDocs[index][FireStoreFields.date]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
                                          ),
                                          Text(
                                            "Location : ${matchDocs[index][FireStoreFields.location]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
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
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                              Text(
                                                "v/s",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                              Text(
                                                "${matchDocs[index][FireStoreFields.team_B_name]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
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
                                                  fontSize: 18,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                              ),
                                              Text(
                                                "${matchDocs[index][FireStoreFields.team_B_player]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 2, 154, 90),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Set 1 :",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_A_set_1_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "-",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_B_set_1_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Set 2 :",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_A_set_2_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "-",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_B_set_2_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Set 3 :",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_A_set_3_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "-",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_B_set_3_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            "Match has been canceled !!",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 47, 153, 240),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              "${matchDocs[index][FireStoreFields.match_name]}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            "Match Date : ${matchDocs[index][FireStoreFields.date]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
                                          ),
                                          Text(
                                            "Location : ${matchDocs[index][FireStoreFields.location]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
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
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                              Text(
                                                "v/s",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                              Text(
                                                "${matchDocs[index][FireStoreFields.team_B_name]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "${matchDocs[index][FireStoreFields.team_A_player1]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 18,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                              ),
                                              Text(
                                                "${matchDocs[index][FireStoreFields.team_B_player1]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "${matchDocs[index][FireStoreFields.team_A_player2]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 18,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                              ),
                                              Text(
                                                "${matchDocs[index][FireStoreFields.team_B_player2]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 2, 154, 90),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Set 1 :",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_A_set_1_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "-",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_B_set_1_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Set 2 :",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_A_set_2_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "-",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_B_set_2_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Set 3 :",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_A_set_3_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "-",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "${matchDocs[index][FireStoreFields.team_B_set_3_points]}",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              47,
                                                              153,
                                                              240),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            "Match has been canceled !!",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 47, 153, 240),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _isSingle = !_isSingle;
              });
            },
            child: Icon(_isSingle ? Icons.person : Icons.people),
          )),
    );
  }
}
