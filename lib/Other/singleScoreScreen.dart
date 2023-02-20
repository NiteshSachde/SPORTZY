// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sportzy/Other/Result.dart';

class SingleScoreScreen extends StatefulWidget {
  var p1,
      p2,
      docRef,
      singlesDocRef,
      t1,
      t2,
      pointTA,
      pointTB,
      setTA,
      setTB,
      setNum,
      match_name,
      team_A_set_1_points,
      team_B_set_1_points,
      team_A_set_2_points,
      team_B_set_2_points,
      team_A_set_3_points,
      team_B_set_3_pints,
      winner_team;
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
    required this.team_A_set_1_points,
    required this.team_A_set_2_points,
    required this.team_A_set_3_points,
    required this.team_B_set_1_points,
    required this.team_B_set_2_points,
    required this.team_B_set_3_pints,
    required this.winner_team,
    // required this.docRef,
    required this.singlesDocRef,
  }) : super(key: mykey);

  @override
  State<SingleScoreScreen> createState() => _SingleScoreScreen();
}

class _SingleScoreScreen extends State<SingleScoreScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // var widget.pointTA;

  // late int _swap1;
  // late var _swapName;
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

  // void _resetAll() {
  //   setState(() {
  //     widget.pointTA = 0;
  //     widget.pointTB = 0;
  //     widget.setTA = 0;
  //     widget.setTB = 0;
  //     widget.setNum = 1;
  //     ;
  //   });
  //   postPointDetailsToFirestore();
  // }

  // void _swapCourt() {
  //   setState(() {
  //     _swap1 = widget.pointTA;
  //     widget.pointTA = widget.pointTB;
  //     widget.pointTB = _swap1;

  //     _swap1 = widget.setTA;
  //     widget.setTA = widget.setTB;
  //     widget.setTB = _swap1;

  //     _swapName = widget.p1;
  //     widget.p1 = widget.p2;
  //     widget.p2 = _swapName;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
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

                      if (widget.pointTA == 21) {
                        if (widget.setNum == 1) {
                          set_1_points();
                          // completeMatch();
                        } else if (widget.setNum == 2) {
                          set_2_points();
                          // completeMatch();
                        } else if (widget.setNum == 3) {
                          set_3_points();
                          // completeMatch();
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
                          completeMatch();
                          // deleteMatch();
                        } else if (widget.setTB == 2) {
                          winningTeam_B();
                          completeMatch();
                          // deleteMatch();
                        }
                        widget.setTA = 0;
                        widget.setTB = 0;
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

                      if (widget.pointTB == 21) {
                        if (widget.setNum == 1) {
                          set_1_points();
                          completeMatch();
                        } else if (widget.setNum == 2) {
                          set_2_points();
                          completeMatch();
                        } else if (widget.setNum == 3) {
                          set_3_points();
                          completeMatch();
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
                          completeMatch();
                          // deleteMatch();
                        } else if (widget.setTB == 2) {
                          winningTeam_B();
                          completeMatch();
                          // deleteMatch();
                        }
                        widget.setTA = 0;
                        widget.setTB = 0;
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
                Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 65,
                    ),
                    onPressed: _decrementCountP1,
                    color: Color.fromARGB(255, 15, 136, 236),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001,
                ),
                Text(
                  "Set " + "${widget.setNum}",
                  style: TextStyle(fontSize: 26),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 65,
                    ),
                    color: Color.fromARGB(255, 15, 136, 236),
                    onPressed: _decrementCountP2,
                  ),
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
                          fontSize: 20,
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.19,
            ),
            // Row(
            //   children: <Widget>[
            //     SizedBox(
            //       width: MediaQuery.of(context).size.width * 0.04,
            //     ),
            //     Container(
            //       height: MediaQuery.of(context).size.height * 0.07,
            //       width: MediaQuery.of(context).size.width * 0.45,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30),
            //         color: null,
            //       ),
            //       child: Center(
            //         child: IconButton(
            //           icon: Icon(
            //             Icons.swap_horiz_sharp,
            //             size: 40,
            //           ),
            //           color: Color.fromARGB(255, 15, 136, 236),
            //           onPressed: _swapCourt,
            //         ),
            //       ),
            //     ),
            //     Container(
            //       height: MediaQuery.of(context).size.height * 0.07,
            //       width: MediaQuery.of(context).size.width * 0.45,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30),
            //         color: null,
            //       ),
            //       child: Center(
            //         child: IconButton(
            //           icon: Icon(
            //             Icons.replay,
            //             size: 40,
            //           ),
            //           onPressed: _resetAll,
            //           color: Color.fromARGB(255, 15, 136, 236),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  completeMatch() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('sport')
        .doc('badminton')
        .collection('completed_singles')
        .doc();
    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('completed_singles')
        .doc(documentReference.id)
        .set({
      'match_name': widget.match_name,
      'team_A_name': widget.t1,
      'team_B_name': widget.t2,
      'team_A_player': widget.p1,
      'team_B_player': widget.p2,
      'team_A_set': widget.setTA,
      'team_B_set': widget.setTB,
    });
    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('completed_singles')
        .doc(documentReference.id)
        .update({
      'team_A_set_1_points': widget.team_A_set_1_points,
      'team_B_set_1_points': widget.team_B_set_1_points,
      'team_A_set_2_points': widget.team_A_set_2_points,
      'team_B_set_2_points': widget.team_B_set_2_points,
      'team_A_set_3_points': widget.team_A_set_3_points,
      'team_B_set_3_points': widget.team_B_set_3_pints,
      'winner_team': widget.winner_team,
    });
  }

  deleteMatch() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('singles')
        .doc(widget.singlesDocRef)
        .delete();
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

    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('singles')
        .doc(widget.singlesDocRef)
        .update({
      'winner_team ': widget.t1.toString(),
    });
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => Result(
              winner: widget.t1.toString(),
            )));
  }

  winningTeam_B() async {
    // calling our firestore

    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('singles')
        .doc(widget.singlesDocRef)
        .update({
      'winner_team ': widget.t2.toString(),
    });
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => Result(
              winner: widget.t2.toString(),
            )));
  }
}
