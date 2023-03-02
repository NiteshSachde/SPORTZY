import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportzy/Dashboard/TT/doubleScoreScreenTT.dart';
import 'package:sportzy/Dashboard/Badminton/doubleScoreScreen.dart';
import 'package:sportzy/Dashboard/Badminton/singleScoreScreen.dart';

import '../Dashboard/TT/singleScoreScreenTT.dart';

class MyLiveMatchesScreen extends StatefulWidget {
  const MyLiveMatchesScreen({super.key});
  @override
  State<MyLiveMatchesScreen> createState() => _MyLiveMatchesScreenState();
}

class _MyLiveMatchesScreenState extends State<MyLiveMatchesScreen>
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
                              .collection('singles')
                              .where("createdBy",
                                  isEqualTo: _auth.currentUser!.uid)
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection('sport')
                              .doc('badminton')
                              .collection('doubles')
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
                        return Expanded(
                          child: ListView.builder(
                            itemCount: snapshot2.data!.docs.length,
                            itemBuilder: (ctx, index) {
                              return _isSingle
                                  ? Container(
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color:
                                            Color.fromARGB(255, 47, 153, 240),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          snapshot2.data!.docs[index]
                                              ['match_name'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      SingleScoreScreen(
                                                        match_name: snapshot2
                                                                .data!
                                                                .docs[index]
                                                            ['match_name'],
                                                        p1: snapshot2.data!
                                                                .docs[index]
                                                            ['team_A_player'],
                                                        p2: snapshot2.data!
                                                                .docs[index]
                                                            ['team_B_player'],
                                                        t1: snapshot2.data!
                                                                .docs[index]
                                                            ['team_A_name'],
                                                        t2: snapshot2.data!
                                                                .docs[index]
                                                            ['team_B_name'],
                                                        singlesDocRef: snapshot2
                                                            .data!
                                                            .docs[index]
                                                            .id,
                                                        pointTA: snapshot2.data!
                                                                .docs[index]
                                                            ['point_team_A'],
                                                        pointTB: snapshot2.data!
                                                                .docs[index]
                                                            ['point_team_B'],
                                                        setTA: snapshot2.data!
                                                                .docs[index]
                                                            ['team_A_set'],
                                                        setTB: snapshot2.data!
                                                                .docs[index]
                                                            ['team_B_set'],
                                                        setNum: snapshot2.data!
                                                                .docs[index]
                                                            ['set_number'],
                                                        mode: snapshot2.data!
                                                                .docs[index]
                                                            ['mode'],
                                                        createdBy: snapshot2
                                                                .data!
                                                                .docs[index]
                                                            ['createdBy'],
                                                      )));
                                        },
                                      ),
                                    )
                                  : Container(
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color:
                                            Color.fromARGB(255, 47, 153, 240),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          snapshot2.data!.docs[index]
                                              ['match_name'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      doubleScoreScreen(
                                                        p1: snapshot2.data!
                                                                .docs[index]
                                                            ['team_A_player1'],
                                                        p2: snapshot2.data!
                                                                .docs[index]
                                                            ['team_A_player2'],
                                                        p3: snapshot2.data!
                                                                .docs[index]
                                                            ['team_B_player1'],
                                                        p4: snapshot2.data!
                                                                .docs[index]
                                                            ['team_B_player2'],
                                                        t1: snapshot2.data!
                                                                .docs[index]
                                                            ['team_A_name'],
                                                        t2: snapshot2.data!
                                                                .docs[index]
                                                            ['team_B_name'],
                                                        doublesDocRef: snapshot2
                                                            .data!
                                                            .docs[index]
                                                            .id,
                                                        match_name: snapshot2
                                                                .data!
                                                                .docs[index]
                                                            ['match_name'],
                                                        pointTA: snapshot2.data!
                                                                .docs[index]
                                                            ['point_team_A'],
                                                        pointTB: snapshot2.data!
                                                                .docs[index]
                                                            ['point_team_B'],
                                                        setNum: snapshot2.data!
                                                                .docs[index]
                                                            ['set_number'],
                                                        setTA: snapshot2.data!
                                                                .docs[index]
                                                            ['team_A_set'],
                                                        setTB: snapshot2.data!
                                                                .docs[index]
                                                            ['team_B_set'],
                                                        mode: snapshot2.data!
                                                                .docs[index]
                                                            ['mode'],
                                                        createdBy: snapshot2
                                                                .data!
                                                                .docs[index]
                                                            ['createdBy'],
                                                      )));
                                        },
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
                              .collection('singles')
                              .where("createdBy",
                                  isEqualTo: _auth.currentUser!.uid)
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection('sport')
                              .doc('TT')
                              .collection('doubles')
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
                        return Expanded(
                          child: ListView.builder(
                            itemCount: snapshot2.data!.docs.length,
                            itemBuilder: (ctx, index) {
                              return _isSingle
                                  ? Container(
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color:
                                            Color.fromARGB(255, 47, 153, 240),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          snapshot2.data!.docs[index]
                                              ['match_name'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      SingleScoreScreenTT(
                                                        match_name: snapshot2
                                                                .data!
                                                                .docs[index]
                                                            ['match_name'],
                                                        p1: snapshot2.data!
                                                                .docs[index]
                                                            ['team_A_player'],
                                                        p2: snapshot2.data!
                                                                .docs[index]
                                                            ['team_B_player'],
                                                        t1: snapshot2.data!
                                                                .docs[index]
                                                            ['team_A_name'],
                                                        t2: snapshot2.data!
                                                                .docs[index]
                                                            ['team_B_name'],
                                                        singlesDocRef: snapshot2
                                                            .data!
                                                            .docs[index]
                                                            .id,
                                                        pointTA: snapshot2.data!
                                                                .docs[index]
                                                            ['point_team_A'],
                                                        pointTB: snapshot2.data!
                                                                .docs[index]
                                                            ['point_team_B'],
                                                        setTA: snapshot2.data!
                                                                .docs[index]
                                                            ['team_A_set'],
                                                        setTB: snapshot2.data!
                                                                .docs[index]
                                                            ['team_B_set'],
                                                        setNum: snapshot2.data!
                                                                .docs[index]
                                                            ['set_number'],
                                                        mode: snapshot2.data!
                                                                .docs[index]
                                                            ['mode'],
                                                        createdBy: snapshot2
                                                                .data!
                                                                .docs[index]
                                                            ['createdBy'],
                                                      )));
                                        },
                                      ),
                                    )
                                  : Container(
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color:
                                            Color.fromARGB(255, 47, 153, 240),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          snapshot2.data!.docs[index]
                                              ['match_name'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      DoubleScoreScreenTT(
                                                        p1: snapshot2.data!
                                                                .docs[index]
                                                            ['team_A_player1'],
                                                        p2: snapshot2.data!
                                                                .docs[index]
                                                            ['team_A_player2'],
                                                        p3: snapshot2.data!
                                                                .docs[index]
                                                            ['team_B_player1'],
                                                        p4: snapshot2.data!
                                                                .docs[index]
                                                            ['team_B_player2'],
                                                        t1: snapshot2.data!
                                                                .docs[index]
                                                            ['team_A_name'],
                                                        t2: snapshot2.data!
                                                                .docs[index]
                                                            ['team_B_name'],
                                                        doublesDocRef: snapshot2
                                                            .data!
                                                            .docs[index]
                                                            .id,
                                                        match_name: snapshot2
                                                                .data!
                                                                .docs[index]
                                                            ['match_name'],
                                                        pointTA: snapshot2.data!
                                                                .docs[index]
                                                            ['point_team_A'],
                                                        pointTB: snapshot2.data!
                                                                .docs[index]
                                                            ['point_team_B'],
                                                        setNum: snapshot2.data!
                                                                .docs[index]
                                                            ['set_number'],
                                                        setTA: snapshot2.data!
                                                                .docs[index]
                                                            ['team_A_set'],
                                                        setTB: snapshot2.data!
                                                                .docs[index]
                                                            ['team_B_set'],
                                                        mode: snapshot2.data!
                                                                .docs[index]
                                                            ['mode'],
                                                        createdBy: snapshot2
                                                                .data!
                                                                .docs[index]
                                                            ['createdBy'],
                                                      )));
                                        },
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
