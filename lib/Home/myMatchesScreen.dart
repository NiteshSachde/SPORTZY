import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportzy/Other/doubleScoreScreen.dart';
import 'package:sportzy/Other/singleScoreScreen.dart';

class MyMatchesScreen extends StatefulWidget {
  const MyMatchesScreen({super.key});
  @override
  State<MyMatchesScreen> createState() => _MyMatchesScreenState();
}

class _MyMatchesScreenState extends State<MyMatchesScreen>
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
                      "Standalone-Match",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Tab(
                    height: 50,
                    child: Text(
                      "Tournament",
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
                            child: Text("No matches!"),
                          );
                        }
                        return Expanded(
                          child: ListView.builder(
                            itemCount: snapshot2.data!.docs.length,
                            itemBuilder: (ctx, index) {
                              return _isSingle
                                  ? ListTile(
                                      title: Text(snapshot2.data!.docs[index]
                                          ['match_name']),
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    SingleScoreScreen(
                                                      match_name: snapshot2
                                                              .data!.docs[index]
                                                          ['match_name'],
                                                      p1: snapshot2
                                                              .data!.docs[index]
                                                          ['team_A_player'],
                                                      p2: snapshot2
                                                              .data!.docs[index]
                                                          ['team_B_player'],
                                                      t1: snapshot2
                                                              .data!.docs[index]
                                                          ['team_A_name'],
                                                      t2: snapshot2
                                                              .data!.docs[index]
                                                          ['team_B_name'],
                                                      singlesDocRef: snapshot2
                                                          .data!.docs[index].id,
                                                      pointTA: snapshot2
                                                              .data!.docs[index]
                                                          ['point_team_A'],
                                                      pointTB: snapshot2
                                                              .data!.docs[index]
                                                          ['point_team_B'],
                                                      setTA: snapshot2
                                                              .data!.docs[index]
                                                          ['team_A_set'],
                                                      setTB: snapshot2
                                                              .data!.docs[index]
                                                          ['team_B_set'],
                                                      setNum: snapshot2
                                                              .data!.docs[index]
                                                          ['set_number'],
                                                      team_A_set_1_points: snapshot2
                                                              .data!
                                                              .docs[index][
                                                          'team_A_set_1_points'],
                                                      team_A_set_2_points: snapshot2
                                                              .data!
                                                              .docs[index][
                                                          'team_A_set_2_points'],
                                                      team_A_set_3_points: snapshot2
                                                              .data!
                                                              .docs[index][
                                                          'team_A_set_3_points'],
                                                      team_B_set_1_points: snapshot2
                                                              .data!
                                                              .docs[index][
                                                          'team_B_set_1_points'],
                                                      team_B_set_2_points: snapshot2
                                                              .data!
                                                              .docs[index][
                                                          'team_B_set_2_points'],
                                                      team_B_set_3_pints: snapshot2
                                                              .data!
                                                              .docs[index][
                                                          'team_B_set_3_points'],
                                                      winner_team: snapshot2
                                                              .data!.docs[index]
                                                          ['winner_team'],
                                                    )));
                                      },
                                    )
                                  : ListTile(
                                      title: Text(snapshot2.data!.docs[index]
                                          ['match_name']),
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    doubleScoreScreen(
                                                      p1: snapshot2
                                                              .data!.docs[index]
                                                          ['team_A_player_1'],
                                                      p2: snapshot2
                                                              .data!.docs[index]
                                                          ['team_A_player_2'],
                                                      p3: snapshot2
                                                              .data!.docs[index]
                                                          ['team_B_player_2'],
                                                      p4: snapshot2
                                                              .data!.docs[index]
                                                          ['team_B_player_2'],
                                                      t1: snapshot2
                                                              .data!.docs[index]
                                                          ['team_A_name'],
                                                      t2: snapshot2
                                                              .data!.docs[index]
                                                          ['team_B_name'],
                                                      doublesDocRef: snapshot2
                                                          .data!.docs[index].id,
                                                    )));
                                      },
                                    );
                            },
                          ),
                        );
                      },
                    ),
                    Center(
                      child: Text(
                        "Tournament",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
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
