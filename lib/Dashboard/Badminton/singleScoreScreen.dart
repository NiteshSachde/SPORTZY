// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sportzy/Dashboard/Badminton/singlesResult.dart';
import 'package:sportzy/Home/Tabs/homeScreen.dart';

class SingleScoreScreen extends StatefulWidget {
  var p1,
      p2,
      singlesDocRef,
      t1,
      t2,
      pointTA,
      pointTB,
      setTA,
      setTB,
      setNum,
      match_name,
      mode,
      createdBy;

  SingleScoreScreen({
    Key? mykey,
    required this.match_name,
    required this.p1,
    required this.p2,
    required this.t1,
    required this.t2,
    required this.pointTA,
    required this.pointTB,
    required this.setTA,
    required this.setTB,
    required this.setNum,
    required this.singlesDocRef,
    required this.mode,
    required this.createdBy,
  }) : super(key: mykey);

  @override
  State<SingleScoreScreen> createState() => _SingleScoreScreen();
}

class _SingleScoreScreen extends State<SingleScoreScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void _decrementCountP1() {
    setState(() {
      if (widget.pointTA < 1) {
        return;
      }
      widget.pointTA--;
    });
    postPointDetailsToFirestore();
  }

  void _decrementCountP2() {
    setState(() {
      if (widget.pointTB < 1) {
        return;
      }
      widget.pointTB--;
    });
    postPointDetailsToFirestore();
  }

  @override
  Widget build(BuildContext context) {
    // completeMatchDetails();
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.033,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 15, 136, 236),
                  ),
                  child: Center(
                    child: Text(
                      '${widget.p1}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 15, 136, 236),
                  ),
                  child: Center(
                    child: Text(
                      '${widget.p2}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.025,
                ),
                GestureDetector(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 15, 136, 236),
                    ),
                    child: Center(
                      child: Text(
                        ("${widget.pointTA}"),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      widget.pointTA++;

                      if (widget.pointTA == widget.mode) {
                        if (widget.setNum == 1) {
                          set_1_points();
                        } else if (widget.setNum == 2) {
                          set_2_points();
                        } else if (widget.setNum == 3) {
                          set_3_points();
                        }
                        widget.pointTA = 0;
                        widget.pointTB = 0;
                        widget.setTA++;
                        widget.setNum++;
                        setDetailsTeam_A();
                      }
                      if (widget.setTA == 2 || widget.setTB == 2) {
                        if (widget.setTA == 2) {
                          winningTeam_A();
                        } else if (widget.setTB == 2) {
                          winningTeam_B();
                        }
                        completeMatchDetails();
                        widget.setTA = 0;
                        widget.setTB = 0;
                        widget.setNum = 1;
                      }
                    });
                    postPointDetailsToFirestore();
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                GestureDetector(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 15, 136, 236),
                    ),
                    child: Center(
                      child: Text(
                        ("${widget.pointTB}"),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: (() {
                    setState(() {
                      widget.pointTB++;

                      if (widget.pointTB == widget.mode) {
                        if (widget.setNum == 1) {
                          set_1_points();
                        } else if (widget.setNum == 2) {
                          set_2_points();
                        } else if (widget.setNum == 3) {
                          set_3_points();
                        }
                        widget.pointTA = 0;
                        widget.pointTB = 0;
                        widget.setTB++;
                        widget.setNum++;
                        setDetailsTeam_B();
                      }
                      if (widget.setTA == 2 || widget.setTB == 2) {
                        if (widget.setTA == 2) {
                          winningTeam_A();

                          // deleteMatch();
                        } else if (widget.setTB == 2) {
                          winningTeam_B();

                          // deleteMatch();
                        }
                        completeMatchDetails();
                        widget.setTA = 0;
                        widget.setTB = 0;
                        widget.setNum = 1;
                      }
                    });
                    postPointDetailsToFirestore();
                  }),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.001,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                GestureDetector(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Center(
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 65,
                          color: Color.fromARGB(255, 15, 136, 236),
                        ),
                      ),
                      color: Colors.transparent),
                  onTap: () {
                    _decrementCountP1();
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.09,
                ),
                Text(
                  "SET " + "${widget.setNum}",
                  style: TextStyle(fontSize: 26),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.06,
                ),
                GestureDetector(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 65,
                      color: Color.fromARGB(255, 15, 136, 236),
                    ),
                    color: Colors.transparent,
                  ),
                  onTap: () {
                    _decrementCountP2();
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.21,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 15, 136, 236),
                  ),
                  child: Center(
                    child: Text(
                      ("${widget.setTA}"),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.21,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 15, 136, 236),
                  ),
                  child: Center(
                    child: Text(
                      ("${widget.setTB}"),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.19,
            ),
            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.05,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Text(
                      "Cancel Match",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    )
                  ],
                ),
              ),
              onTap: () {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.confirm,
                  title: 'Cancel Match',
                  text: 'Really want to cancel match ?',
                  onConfirmBtnTap: () async {
                    FirebaseFirestore firebaseFirestore =
                        FirebaseFirestore.instance;
                    await firebaseFirestore
                        .collection('sport')
                        .doc('badminton')
                        .collection('singles')
                        .doc(widget.singlesDocRef)
                        .delete();
                    Navigator.pushAndRemoveUntil(
                        (context),
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  completeMatchDetails() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var snapshot = await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('singles')
        .doc(widget.singlesDocRef)
        .get();
    var match_name = snapshot['match_name'];
    var team_A_name = snapshot['team_A_name'];
    var team_B_name = snapshot['team_B_name'];
    var team_A_player = snapshot['team_A_player'];
    var team_B_player = snapshot['team_B_player'];
    var team_A_set = snapshot['team_A_set'];
    // var team_B_set = snapshot['team_B_set'];
    var team_A_set_1_points = snapshot['team_A_set_1_points'];
    var team_A_set_2_points = snapshot['team_A_set_2_points'];
    var team_A_set_3_points = snapshot['team_A_set_3_points'];
    var team_B_set_1_points = snapshot['team_B_set_1_points'];
    var team_B_set_2_points = snapshot['team_B_set_2_points'];
    var team_B_set_3_points = snapshot['team_B_set_3_points'];
    var date = snapshot['date'];
    var winner_team;
    var match_array = snapshot['match_array'];
    var location = snapshot['location'];
    if (team_A_set == 2) {
      winner_team = widget.t1;
    } else {
      winner_team = widget.t2;
    }

    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('completed_singles')
        .add({
      'match_name': match_name,
      'match_array': match_array,
      'team_A_name': team_A_name,
      'team_B_name': team_B_name,
      'team_A_player': team_A_player,
      'team_B_player': team_B_player,
      'team_A_set_1_points': team_A_set_1_points,
      'team_A_set_2_points': team_A_set_2_points,
      'team_A_set_3_points': team_A_set_3_points,
      'team_B_set_1_points': team_B_set_1_points,
      'team_B_set_2_points': team_B_set_2_points,
      'team_B_set_3_points': team_B_set_3_points,
      'winner_team': winner_team,
      'date': date,
      'createdBy': widget.createdBy,
      'location': location,
    });
  }

  postPointDetailsToFirestore() async {
    // calling our firestore

    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('singles')
        .doc(widget.singlesDocRef)
        .update({
      'point_team_A': widget.pointTA,
      'point_team_B': widget.pointTB,
    });
  }

  set_1_points() async {
    // calling our firestore

    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('singles')
        .doc(widget.singlesDocRef)
        .update({
      'team_A_set_1_points': widget.pointTA,
      'team_B_set_1_points': widget.pointTB,
    });
  }

  set_2_points() async {
    // calling our firestore

    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('singles')
        .doc(widget.singlesDocRef)
        .update({
      'team_A_set_2_points': widget.pointTA,
      'team_B_set_2_points': widget.pointTB,
    });
  }

  set_3_points() async {
    // calling our firestore

    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('singles')
        .doc(widget.singlesDocRef)
        .update({
      'team_A_set_3_points': widget.pointTA,
      'team_B_set_3_points': widget.pointTB,
    });
  }

  setDetailsTeam_A() async {
    // calling our firestore

    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('singles')
        .doc(widget.singlesDocRef)
        .update({
      'team_A_set': widget.setTA,
      'set_number': widget.setNum,
    });
  }

  setDetailsTeam_B() async {
    // calling our firestore

    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('singles')
        .doc(widget.singlesDocRef)
        .update({
      'team_B_set': widget.setTB,
      'set_number': widget.setNum,
    });
  }

  winningTeam_A() async {
    // calling our firestore

    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
            builder: (context) => SinglesResult(
                winner: widget.t1.toString(),
                singlesDocRef: widget.singlesDocRef)),
        (route) => false);

    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('singles')
        .doc(widget.singlesDocRef)
        .update({
      'winner_team ': widget.t1.toString(),
    });
  }

  winningTeam_B() async {
    // calling our firestore

    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
            builder: (context) => SinglesResult(
                winner: widget.t2.toString(),
                singlesDocRef: widget.singlesDocRef)),
        (route) => false);
    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('singles')
        .doc(widget.singlesDocRef)
        .update({
      'winner_team ': widget.t2.toString(),
    });
  }
}
