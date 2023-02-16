import 'package:sportzy/Nitesh/firestoreFields.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LiveScoreSingles extends StatefulWidget {
  const LiveScoreSingles({super.key});

  @override
  State<LiveScoreSingles> createState() => _LiveScoreSinglesState();
}

class _LiveScoreSinglesState extends State<LiveScoreSingles> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('sport')
            .doc('badminton')
            .collection('singles')
            .snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
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
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 47, 153, 240),
                        borderRadius: BorderRadius.circular(30),
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
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${matchDocs[index][FireStoreFields.team_A_name]}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 47, 153, 240),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Text(
                          "v/s",
                          style: TextStyle(
                            color: Color.fromARGB(255, 47, 153, 240),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Text(
                          "${matchDocs[index][FireStoreFields.team_B_name]}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 47, 153, 240),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${matchDocs[index][FireStoreFields.team_A_player]}",
                          style: TextStyle(
                            color: Color.fromARGB(255, 47, 153, 240),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Text(
                          "${matchDocs[index][FireStoreFields.team_B_player]}",
                          style: TextStyle(
                            color: Color.fromARGB(255, 47, 153, 240),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 241, 28, 74)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "${matchDocs[index][FireStoreFields.point_team_A]}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 47, 153, 240),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Text(
                                  "${matchDocs[index][FireStoreFields.point_team_B]}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 47, 153, 240),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 2, 154, 90),
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Set 1 :",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 47, 153, 240),
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                Text(
                                  "${matchDocs[index][FireStoreFields.team_A_set_1_points]}",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 47, 153, 240),
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  "-",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 47, 153, 240),
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  "${matchDocs[index][FireStoreFields.team_B_set_1_points]}",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 47, 153, 240),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Set 2 :",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 47, 153, 240),
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                Text(
                                  "${matchDocs[index][FireStoreFields.team_A_set_2_points]}",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 47, 153, 240),
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  "-",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 47, 153, 240),
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  "${matchDocs[index][FireStoreFields.team_B_set_2_points]}",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 47, 153, 240),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Set 3 :",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 47, 153, 240),
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                Text(
                                  "${matchDocs[index][FireStoreFields.team_A_set_3_points]}",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 47, 153, 240),
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  "-",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 47, 153, 240),
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  "${matchDocs[index][FireStoreFields.team_B_set_3_points]}",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 47, 153, 240),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
