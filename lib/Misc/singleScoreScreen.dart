// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sportzy/Misc/Result.dart';
import 'package:sportzy/Home/homeScreen.dart';

class SingleScoreScreen extends StatefulWidget {
  var p1, p2, docRef, singlesDocRef, t1, t2;
  SingleScoreScreen({
    Key? mykey,
    required this.p1,
    required this.p2,
    required this.t1,
    required this.t2,
    // required this.docRef,
    required this.singlesDocRef,
  }) : super(key: mykey);

  @override
  State<SingleScoreScreen> createState() => _SingleScoreScreen();
}

class _SingleScoreScreen extends State<SingleScoreScreen> {
  int _countert1 = 0;
  int _countert2 = 0;
  int _setCountt1 = 0;
  int _setCountt2 = 0;
  int _setNumber = 1;
  late int _swap1;
  late var _swapName;
  void _decrementCountP1() {
    setState(() {
      if (_countert1 < 1) {
        return;
      }
      _countert1--;
    });
    postPointDetailsToFirestore();
  }

  void _decrementCountP2() {
    setState(() {
      if (_countert2 < 1) {
        return;
      }
      _countert2--;
    });
    postPointDetailsToFirestore();
  }

  void _resetAll() {
    setState(() {
      _countert1 = 0;
      _countert2 = 0;
      _setCountt1 = 0;
      _setCountt2 = 0;
      _setNumber = 1;
      ;
    });
    postPointDetailsToFirestore();
  }

  void _swapCourt() {
    setState(() {
      _swap1 = _countert1;
      _countert1 = _countert2;
      _countert2 = _swap1;

      _swap1 = _setCountt1;
      _setCountt1 = _setCountt2;
      _setCountt2 = _swap1;

      _swapName = widget.p1;
      widget.p1 = widget.p2;
      widget.p2 = _swapName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: ((context) {
              return AlertDialog(
                title: Text("Alert"),
                content: Text("Do you want to cancel match ?"),
                actions: [
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text("No")),
                  ElevatedButton(
                      onPressed: () {
                        deleteMatch();
                        Navigator.pushAndRemoveUntil(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                            (route) => false);
                      },
                      child: Text("Cancel"))
                ],
              );
            }));
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
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
                          ("${_countert1}"),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _countert1++;

                        if (_countert1 == 21) {
                          if (_setNumber == 1) {
                            set_1_points();
                          } else if (_setNumber == 2) {
                            set_2_points();
                          } else if (_setNumber == 3) {
                            set_3_points();
                          }
                          _countert1 = 0;
                          _countert2 = 0;
                          _setCountt1++;
                          setDetailsTeam_A();
                          _setNumber++;
                        }
                        if (_setCountt1 == 2 || _setCountt2 == 2) {
                          if (_setCountt1 == 2) {
                            winningTeam_A();
                          } else if (_setCountt2 == 2) {
                            winningTeam_B();
                          }
                          _setCountt1 = 0;
                          _setCountt2 = 0;
                          _setNumber = 1;
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
                          ("${_countert2}"),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: (() {
                      setState(() {
                        _countert2++;

                        if (_countert2 == 21) {
                          if (_setNumber == 1) {
                            set_1_points();
                          } else if (_setNumber == 2) {
                            set_2_points();
                          } else if (_setNumber == 3) {
                            set_3_points();
                          }
                          _countert1 = 0;
                          _countert2 = 0;
                          _setCountt2++;
                          setDetailsTeam_B();
                          _setNumber++;
                        }
                        if (_setCountt1 == 2 || _setCountt2 == 2) {
                          if (_setCountt1 == 2) {
                            winningTeam_A();
                          } else if (_setCountt2 == 2) {
                            winningTeam_B();
                          }
                          _setCountt1 = 0;
                          _setCountt2 = 0;
                          _setNumber = 1;
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
                    "Set " + "${_setNumber}",
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
                        ("${_setCountt1}"),
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
                        ("${_setCountt2}"),
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
      ),
    );
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
      'point_team_A': _countert1,
      'point_team_B': _countert2,
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
      'team_A_set_1_points': _countert1,
      'team_B_set_1_points': _countert2,
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
      'team_A_set_2_points': _countert1,
      'team_B_set_2_points': _countert2,
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
      'team_A_set_3_points': _countert1,
      'team_B_set_3_points': _countert2,
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
      'team_A_set': _setCountt1,
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
      'team_B_set': _setCountt2,
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