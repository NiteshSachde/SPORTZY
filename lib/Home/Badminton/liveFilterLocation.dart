import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sportzy/Others/firestoreFields.dart';

class LiveFilterLocation extends StatefulWidget {
  const LiveFilterLocation({super.key});
  @override
  State<LiveFilterLocation> createState() => _LiveFilterLocationState();
}

class _LiveFilterLocationState extends State<LiveFilterLocation> {
  bool _isSingle = true;
  List searchResult = [];
  List searchResult2 = [];
  void searchFromFirebaseSingles(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('sport')
        .doc('badminton')
        .collection('singles')
        .where('location_array', arrayContains: query)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  void searchFromFirebaseDoubles(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('sport')
        .doc('badminton')
        .collection('doubles')
        .where('location_array', arrayContains: query)
        .get();

    setState(() {
      searchResult2 = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _isSingle
            ? SizedBox(
                height: double.infinity,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 20, bottom: 15),
                      child: TextFormField(
                        // controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Enter match name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onChanged: (query) {
                          print(query);
                          searchFromFirebaseSingles(query.toLowerCase());
                        },
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

                        return Expanded(
                          child: ListView.builder(
                            itemCount: searchResult.length,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 47, 153, 240),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                   child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                      Text(
                                        "${searchResult[index][FireStoreFields.match_name]}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          child: Icon(Icons.share,
                                          color: Colors.white,),
                                        ),
                                        onTap: ()async {
                                         var sharedetails =
                        "Sportzy: Hey! New Match Is Being Played Between ${searchResult[index][FireStoreFields.team_A_name]} V/S ${searchResult[index][FireStoreFields.team_A_name]} Just Search Match Name \"${searchResult[index][FireStoreFields.match_name]}\" On Sportzy Application.";
                    await Share.share(sharedetails);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    "Match Date : ${searchResult[index][FireStoreFields.date]}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005,
                                  ),
                                  Text(
                                    "Location : ${searchResult[index][FireStoreFields.location]}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "${searchResult[index][FireStoreFields.team_A_name]}",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 153, 240),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      Text(
                                        "v/s",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 153, 240),
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      Text(
                                        "${searchResult[index][FireStoreFields.team_B_name]}",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 153, 240),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "${searchResult[index][FireStoreFields.team_A_player]}",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 153, 240),
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                      ),
                                      Text(
                                        "${searchResult[index][FireStoreFields.team_B_player]}",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 153, 240),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromARGB(255, 241, 28, 74),
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "${searchResult[index][FireStoreFields.point_team_A]}",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 47, 153, 240),
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                              ),
                                              Text(
                                                "${searchResult[index][FireStoreFields.point_team_B]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 153, 240),
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "Set 1 :",
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
                                                    0.07,
                                              ),
                                              Text(
                                                "${searchResult[index][FireStoreFields.team_A_set_1_points]}",
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
                                                    0.03,
                                              ),
                                              Text(
                                                "-",
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
                                                    0.03,
                                              ),
                                              Text(
                                                "${searchResult[index][FireStoreFields.team_B_set_1_points]}",
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
                                                "Set 2 :",
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
                                                    0.07,
                                              ),
                                              Text(
                                                "${searchResult[index][FireStoreFields.team_A_set_2_points]}",
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
                                                    0.03,
                                              ),
                                              Text(
                                                "-",
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
                                                    0.03,
                                              ),
                                              Text(
                                                "${searchResult[index][FireStoreFields.team_B_set_2_points]}",
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
                                                "Set 3 :",
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
                                                    0.07,
                                              ),
                                              Text(
                                                "${searchResult[index][FireStoreFields.team_A_set_3_points]}",
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
                                                    0.03,
                                              ),
                                              Text(
                                                "-",
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
                                                    0.03,
                                              ),
                                              Text(
                                                "${searchResult[index][FireStoreFields.team_B_set_3_points]}",
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
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            : SizedBox(
                height: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 20, bottom: 15),
                      child: TextFormField(
                        // controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Enter match name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onChanged: (query) {
                          print(query);
                          searchFromFirebaseDoubles(query.toLowerCase());
                        },
                      ),
                    ),
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

                        return Expanded(
                          child: ListView.builder(
                            itemCount: searchResult2.length,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 47, 153, 240),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                      Text(
                                        "${searchResult2[index][FireStoreFields.match_name]}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          child: Icon(Icons.share,
                                          color: Colors.white,),
                                        ),
                                        onTap: ()async {
                                         var sharedetails =
                        "Sportzy: Hey! New Match Is Being Played Between ${searchResult2[index][FireStoreFields.team_A_name]} V/S ${searchResult2[index][FireStoreFields.team_A_name]} Just Search Match Name \"${searchResult2[index][FireStoreFields.match_name]}\" On Sportzy Application.";
                    await Share.share(sharedetails);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    "Match Date : ${searchResult2[index][FireStoreFields.date]}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005,
                                  ),
                                  Text(
                                    "Location : ${searchResult2[index][FireStoreFields.location]}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "${searchResult2[index][FireStoreFields.team_A_name]}",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 153, 240),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      Text(
                                        "v/s",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 153, 240),
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      Text(
                                        "${searchResult2[index][FireStoreFields.team_B_name]}",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 153, 240),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "${searchResult2[index][FireStoreFields.team_A_player1]}",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 153, 240),
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                      ),
                                      Text(
                                        "${searchResult2[index][FireStoreFields.team_B_player1]}",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 153, 240),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "${searchResult2[index][FireStoreFields.team_A_player2]}",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 153, 240),
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                      ),
                                      Text(
                                        "${searchResult2[index][FireStoreFields.team_B_player2]}",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 153, 240),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromARGB(255, 241, 28, 74),
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "${searchResult2[index][FireStoreFields.point_team_A]}",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 47, 153, 240),
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                          ),
                                          Text(
                                            "${searchResult2[index][FireStoreFields.point_team_B]}",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 47, 153, 240),
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "Set 1 :",
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
                                                    0.07,
                                              ),
                                              Text(
                                                "${searchResult2[index][FireStoreFields.team_A_set_1_points]}",
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
                                                    0.03,
                                              ),
                                              Text(
                                                "-",
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
                                                    0.03,
                                              ),
                                              Text(
                                                "${searchResult2[index][FireStoreFields.team_B_set_1_points]}",
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
                                                "Set 2 :",
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
                                                    0.07,
                                              ),
                                              Text(
                                                "${searchResult2[index][FireStoreFields.team_A_set_2_points]}",
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
                                                    0.03,
                                              ),
                                              Text(
                                                "-",
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
                                                    0.03,
                                              ),
                                              Text(
                                                "${searchResult2[index][FireStoreFields.team_B_set_2_points]}",
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
                                                "Set 3 :",
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
                                                    0.07,
                                              ),
                                              Text(
                                                "${searchResult2[index][FireStoreFields.team_A_set_3_points]}",
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
                                                    0.03,
                                              ),
                                              Text(
                                                "-",
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
                                                    0.03,
                                              ),
                                              Text(
                                                "${searchResult2[index][FireStoreFields.team_B_set_3_points]}",
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
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
          child: Icon(_isSingle ? Icons.person : Icons.people),
          onPressed: () {
            setState(() {
              _isSingle = !_isSingle;
            });
          },
        ),
      ),
    );
  }
}
