import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:sportzy/Heet/singleScoreScreen.dart';

import '../Heet/doubleScoreScreen.dart';

class DoublesBadminton extends StatefulWidget {
  const DoublesBadminton({Key? key}) : super(key: key);

  @override
  State<DoublesBadminton> createState() => _DoublesBadminton();
}

class _DoublesBadminton extends State<DoublesBadminton> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController t1p1 = new TextEditingController();
  final TextEditingController t1p2 = new TextEditingController();
  final TextEditingController t2p1 = new TextEditingController();
  final TextEditingController t2p2 = new TextEditingController();
  final TextEditingController m = new TextEditingController();
  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final mField = TextFormField(
      autofocus: false,
      controller: m,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,12}$');
        if (value!.isEmpty) {
          return ("Name cannot be empty !");
        }
        if (!regex.hasMatch(value)) {
          return ("Minimum 3 and Maximum 12 characters)");
        }
        return null;
      },
      onSaved: (value) {
        m.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.edit),
          contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          hintText: "Enter Match Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    final t1Field = TextFormField(
      autofocus: false,
      controller: t1,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,12}$');
        if (value!.isEmpty) {
          return ("Name cannot be empty !");
        }
        if (!regex.hasMatch(value)) {
          return ("Minimum 3 and Maximum 12 characters");
        }
        return null;
      },
      onSaved: (value) {
        t1.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.people),
          contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          hintText: "Team A Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    final t2Field = TextFormField(
      autofocus: false,
      controller: t2,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,12}$');
        if (value!.isEmpty) {
          return ("Name cannot be empty !");
        }
        if (!regex.hasMatch(value)) {
          return ("Minimum 3 and Maximum 12 characters");
        }
        return null;
      },
      onSaved: (value) {
        t2.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.people),
          contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          hintText: "Team B Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    final t1p1Field = TextFormField(
      autofocus: false,
      controller: t1p1,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,12}$');
        if (value!.isEmpty) {
          return ("Name cannot be empty !");
        }
        if (!regex.hasMatch(value)) {
          return ("Minimum 3 and Maximum 12 characters");
        }
        return null;
      },
      onSaved: (value) {
        t1p1.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          hintText: "Player 1 Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    final t1p2Field = TextFormField(
      autofocus: false,
      controller: t1p2,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,12}$');
        if (value!.isEmpty) {
          return ("Name cannot be empty !");
        }
        if (!regex.hasMatch(value)) {
          return ("Minimum 3 and Maximum 12 characters");
        }
        return null;
      },
      onSaved: (value) {
        t1p2.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          hintText: "Player 2 Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    final t2p1Field = TextFormField(
      autofocus: false,
      controller: t2p1,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,12}$');
        if (value!.isEmpty) {
          return ("Name cannot be empty !");
        }
        if (!regex.hasMatch(value)) {
          return ("Minimum 3 and Maximum 12 characters");
        }
        return null;
      },
      onSaved: (value) {
        t2p1.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          hintText: "Player 1 Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    final t2p2Field = TextFormField(
      autofocus: false,
      controller: t2p2,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,12}$');
        if (value!.isEmpty) {
          return ("Name cannot be empty !");
        }
        if (!regex.hasMatch(value)) {
          return ("Minimum 3 and Maximum 12 characters");
        }
        return null;
      },
      onSaved: (value) {
        t2p2.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          hintText: "Player 2 Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    final SignupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 50, 115, 228),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (() {
          if (_formKey.currentState!.validate()) {
            postMatchDetailsToFirestore(
                m.text.trim(),
                t1.text.trim(),
                t2.text.trim(),
                t1p1.text.trim(),
                t1p2.text.trim(),
                t2p1.text.trim(),
                t2p2.text.trim());
          }
        }),
        child: Text(
          "Create",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 17, 71, 234),
              Color.fromARGB(255, 50, 115, 228),
              Color.fromARGB(255, 88, 192, 233),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
              child: Text(
                "Match Details",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Expanded(
              child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          // SizedBox(
                          //   width: MediaQuery.of(context).size.width * 0.2,
                          // ),
                          Container(
                            child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                    ),
                                    Text(
                                      "Enter Match Name",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    mField,
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    Text(
                                      "Enter Team Name",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    t1Field,
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    t2Field,
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Team A",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    t1p1Field,
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    t1p2Field,
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Team B",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    t2p1Field,
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    t2p2Field,
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                    ),
                                    SignupButton,
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  postMatchDetailsToFirestore(String m, String t1, String t2, String t1p1,
      String t1p2, String t2p1, String t2p2) async {
    // calling our firestore

    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('sport')
        .doc('badminton')
        .collection('doubles')
        .doc();
    await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('doubles')
        .doc(documentReference.id)
        .set({
      'match_name': m,
      'team_A_name': t1,
      'team_B_name': t2,
      'team_A_player1': t1p1,
      'team_B_player1': t2p1,
      'team_A_player2': t1p2,
      'team_B_player2': t2p2,
    });
    print(documentReference);
    var docRef = await firebaseFirestore
        .collection('sport')
        .doc('badminton')
        .collection('doubles')
        .doc(documentReference.id)
        .update({
      'point_team_A': 0,
      'point_team_B': 0,
      'team_A_set_1_points': "",
      'team_B_set_1_points': "",
      'team_A_set_2_points': "",
      'team_B_set_2_points': "",
      'team_A_set_3_points': "",
      'team_B_set_3_points': "",
      'team_A_set': 0,
      'team_B_set': 0,
    });
    //print(docRef.id);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => doubleScoreScreen(
              p1: t1p1,
              p2: t1p2,
              p3: t2p1,
              p4: t2p2,
              //docRef: docRef.id.toString(),
              doublesDocRef: documentReference.id.toString(),
            )));
  }
}


// import 'package:flutter/material.dart';
// import 'package:sportzy/Heet/doubleScoreScreen.dart';

// class DoublesBadminton extends StatefulWidget {
//   const DoublesBadminton({Key? key}) : super(key: key);

//   @override
//   State<DoublesBadminton> createState() => _DoublesBadminton();
// }

// class _DoublesBadminton extends State<DoublesBadminton> {
//   TextEditingController _t1p1 = new TextEditingController();
//   TextEditingController _t1p2 = new TextEditingController();
//   TextEditingController _t2p1 = new TextEditingController();
//   TextEditingController _t2p2 = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         height: size.height,
//         width: size.width,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             colors: [
//               Color.fromARGB(255, 17, 71, 234),
//               Color.fromARGB(255, 50, 115, 228),
//               Color.fromARGB(255, 88, 192, 233),
//             ],
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.07,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
//               child: Text(
//                 "Team Details",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 34,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.04,
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: NeverScrollableScrollPhysics(),
//                 child: Container(
//                   height: size.height,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(50),
//                         topRight: Radius.circular(50)),
//                   ),
//                   child: Container(
//                     margin: EdgeInsets.only(left: 25, right: 25),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.04,
//                         ),
//                         Text(
//                           "Team A",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.02,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30),
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                   blurRadius: 10,
//                                   spreadRadius: 7,
//                                   offset: Offset(1, 1),
//                                   color: Colors.grey.withOpacity(0.3)),
//                             ],
//                           ),
//                           child: TextField(
//                             controller: _t1p1,
//                             decoration: InputDecoration(
//                                 icon: Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: Icon(
//                                     Icons.person,
//                                     color: Color.fromARGB(149, 0, 0, 0),
//                                   ),
//                                 ),
//                                 hintText: "Player 1 Name",
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide: BorderSide(
//                                         color: Colors.white, width: 1.0)),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide: BorderSide(
//                                         color: Colors.white, width: 1.0)),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30))),
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.02,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30),
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                   blurRadius: 10,
//                                   spreadRadius: 7,
//                                   offset: Offset(1, 1),
//                                   color: Colors.grey.withOpacity(0.3)),
//                             ],
//                           ),
//                           child: TextField(
//                             controller: _t1p2,
//                             decoration: InputDecoration(
//                                 icon: Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: Icon(
//                                     Icons.person,
//                                     color: Color.fromARGB(149, 0, 0, 0),
//                                   ),
//                                 ),
//                                 hintText: "Player 2 Name",
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide: BorderSide(
//                                         color: Colors.white, width: 1.0)),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide: BorderSide(
//                                         color: Colors.white, width: 1.0)),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30))),
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.04,
//                         ),
//                         Text(
//                           "Team B",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.02,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30),
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                   blurRadius: 10,
//                                   spreadRadius: 7,
//                                   offset: Offset(1, 1),
//                                   color: Colors.grey.withOpacity(0.3)),
//                             ],
//                           ),
//                           child: TextField(
//                             controller: _t2p1,
//                             decoration: InputDecoration(
//                                 icon: Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: Icon(
//                                     Icons.person,
//                                     color: Color.fromARGB(149, 0, 0, 0),
//                                   ),
//                                 ),
//                                 hintText: "Player 1 Name",
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide: BorderSide(
//                                         color: Colors.white, width: 1.0)),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide: BorderSide(
//                                         color: Colors.white, width: 1.0)),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30))),
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.02,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30),
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                   blurRadius: 10,
//                                   spreadRadius: 7,
//                                   offset: Offset(1, 1),
//                                   color: Colors.grey.withOpacity(0.3)),
//                             ],
//                           ),
//                           child: TextField(
//                             controller: _t2p2,
//                             decoration: InputDecoration(
//                                 icon: Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: Icon(
//                                     Icons.person,
//                                     color: Color.fromARGB(149, 0, 0, 0),
//                                   ),
//                                 ),
//                                 hintText: "Player 2 Name",
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide: BorderSide(
//                                         color: Colors.white, width: 1.0)),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide: BorderSide(
//                                         color: Colors.white, width: 1.0)),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30))),
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.05,
//                         ),
//                         GestureDetector(
//                           child: Container(
//                             height: 50,
//                             width: size.width,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//                               color: Color.fromARGB(255, 68, 167, 248),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "Add Players",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           onTap: (() {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     doubleScoreScreen(
//                                       p1: _t1p1.text,
//                                       p2: _t1p2.text,
//                                       p3: _t2p1.text,
//                                       p4: _t2p2.text,
//                                     )));
//                           }),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
