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
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
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
                      Expanded(
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection(FireStoreBucket.sport)
                              .doc('badminton')
                              .collection('singles')
                              .snapshots(),
                          builder: (__,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              if (snapshot.data!.docs.isNotEmpty) {
                                return ListView.separated(
                                    itemBuilder: (__, int index) {
                                      Map<String, dynamic> docData =
                                          snapshot.data!.docs[index].data();
                                      if (docData.isEmpty) {
                                        return Text("Document is empty !");
                                      }
                                      String match_name =
                                          docData[FireStoreFields.match_name];
                                      String team_A_name =
                                          docData[FireStoreFields.team_A_name];
                                      String team_B_name =
                                          docData[FireStoreFields.team_B_name];
                                      String team_A_player = docData[
                                          FireStoreFields.team_A_player];
                                      String team_B_player = docData[
                                          FireStoreFields.team_B_player];

                                      return Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        child: Column(
                                          children: <Widget>[
                                            Text(match_name),
                                            Text(team_A_name),
                                            Text(team_B_name),
                                            Text(team_A_player),
                                            Text(team_B_player),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (__, ___) {
                                      return const Divider();
                                    },
                                    itemCount: snapshot.data!.docs.length);
                              } else {
                                return Center(
                                  child: Text("Documents aren't available !"),
                                );
                              }
                            } else {
                              return Center(
                                child: Text("Getting Error !"),
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
