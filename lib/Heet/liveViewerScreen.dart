import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sportzy/Nitesh/firestoreBucket.dart';
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
                      height: MediaQuery.of(context).size.height * 0.05,
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
                      height: MediaQuery.of(context).size.height * 0.04,
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
                                itemBuilder: (context, index) => Column(
                                      children: <Widget>[
                                        Text(
                                            "Match Name : ${matchDocs[index][FireStoreFields.match_name]}"),
                                        Text(
                                            "Team A Name : ${matchDocs[index][FireStoreFields.team_A_name]}"),
                                        Text(
                                            "Team B Name : ${matchDocs[index][FireStoreFields.team_B_name]}"),
                                        Text(
                                            "Team A Player Name : ${matchDocs[index][FireStoreFields.team_A_player]}"),
                                        Text(
                                            "Team B Player Name : ${matchDocs[index][FireStoreFields.team_B_player]}"),
                                      ],
                                    )),
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
