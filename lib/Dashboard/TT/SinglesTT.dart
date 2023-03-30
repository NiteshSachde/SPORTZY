import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:sportzy/Home/Tabs/homeScreen.dart';
import 'package:intl/intl.dart';

class SinglesTT extends StatefulWidget {
  const SinglesTT({Key? key}) : super(key: key);

  @override
  State<SinglesTT> createState() => _SinglesTT();
}

class _SinglesTT extends State<SinglesTT> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController p1 = new TextEditingController();
  final TextEditingController p2 = new TextEditingController();
  final TextEditingController m = new TextEditingController();
  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController l = new TextEditingController();

  var _points;
  @override
  void initState() {
    setState(() {
      _points = 11;
    });
    super.initState();
  }

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
          return ("Match Name cannot be empty !");
        }
        if (!regex.hasMatch(value)) {
          return ("Minimum 3 and Maximum 12 characters");
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
          return ("Team Name cannot be empty !");
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
          return ("Team Name cannot be empty !");
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
    final p1Field = TextFormField(
      autofocus: false,
      controller: p1,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{2,12}$');
        if (value!.isEmpty) {
          return ("Player Name cannot be empty !");
        }
        if (!regex.hasMatch(value)) {
          return ("Minimum 2 and Maximum 12 characters");
        }
        return null;
      },
      onSaved: (value) {
        p1.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          hintText: "Player Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    final p2Field = TextFormField(
      autofocus: false,
      controller: p2,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{2,12}$');
        if (value!.isEmpty) {
          return ("Player Name cannot be empty !");
        }
        if (!regex.hasMatch(value)) {
          return ("Minimum 2 and Maximum 12 characters");
        }
        return null;
      },
      onSaved: (value) {
        p2.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          hintText: "Player Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    final lField = TextFormField(
      autofocus: false,
      controller: l,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{2,12}$');
        if (value!.isEmpty) {
          return ("Location cannot be empty !");
        }
        if (!regex.hasMatch(value)) {
          return ("Minimum 2 and Maximum 12 characters");
        }
        return null;
      },
      onSaved: (value) {
        l.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.location_on),
          contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          hintText: "Location",
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
            postMatchDetailsToFirestore(m.text.trim(), t1.text.trim(),
                t2.text.trim(), p1.text.trim(), p2.text.trim(), l.text.trim());
          }
        }),
        child: Text(
          "Create Match",
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
                                              0.015,
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
                                    p1Field,
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
                                    p2Field,
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Location",
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
                                    lField,
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Mode : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Radio(
                                          value: 11,
                                          groupValue: _points,
                                          onChanged: (value) {
                                            setState(() {
                                              _points = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          "11 Points",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Radio(
                                          value: 21,
                                          groupValue: _points,
                                          onChanged: (value) {
                                            setState(() {
                                              _points = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          "21 Points",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
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

  postMatchDetailsToFirestore(
      String m, String t1, String t2, String p1, String p2, String l) async {
    String match = m.toLowerCase();
    List<String> listnumber = match.split("");
    List<String> output = []; // int -> String
    for (int i = 0; i < listnumber.length; i++) {
      if (i != listnumber.length - 1) {
        output.add(listnumber[i]); //
      }
      List<String> temp = [listnumber[i]];
      for (int j = i + 1; j < listnumber.length; j++) {
        temp.add(listnumber[j]); //
        output.add((temp.join()));
      }
    }
    print(output.toString());

    //Splitting for location
    String location = l.toLowerCase();
    List<String> listnum = location.split("");
    List<String> result = []; // int -> String
    for (int i = 0; i < listnum.length; i++) {
      if (i != listnum.length - 1) {
        result.add(listnum[i]); //
      }
      List<String> temp = [listnum[i]];
      for (int j = i + 1; j < listnum.length; j++) {
        temp.add(listnum[j]); //
        result.add((temp.join()));
      }
    }
    print(result.toString());
    // calling our firestore

    // sending these values
    var now = DateTime.now();

    var date = (DateFormat.yMMMMd().format(now));
    final _auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('sport')
        .doc('TT')
        .collection('singles')
        .doc();
    await firebaseFirestore
        .collection('sport')
        .doc('TT')
        .collection('singles')
        .doc(documentReference.id)
        .set({
      'match_name': m,
      'match_array': FieldValue.arrayUnion(output),
      'team_A_name': t1,
      'team_B_name': t2,
      'team_A_player': p1,
      'team_B_player': p2,
      'location': l,
      'location_array': FieldValue.arrayUnion(result),
      'createdBy': _auth.currentUser!.uid,
      'date': date.toString(),
      'mode': _points,
    });
    print(documentReference);
    await firebaseFirestore
        .collection('sport')
        .doc('TT')
        .collection('singles')
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
      'set_number': 1,
    });
    Fluttertoast.showToast(msg: "Match Added To Your Profile");

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (ctx) {
        return HomeScreen();
      },
    ), (route) => false);
  }
}
