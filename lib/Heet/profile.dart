// import 'package:flutter/material.dart';
// import 'package:gender_picker/source/enums.dart';
// import 'package:sportzy/Heet/HomePage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:gender_picker/source/gender_picker.dart';

// class Profile extends StatefulWidget {
//   DocumentReference userid;
//   Profile({Key? key, required this.userid}) : super(key: key);
//   static String verify = "";
//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   bool passObscured = true;
//   bool conpassObscured = true;
//   var phone = "";
//   CollectionReference users = FirebaseFirestore.instance.collection('users');
//   late String uname;
//   late String uemail;
//   late String uage;
//   late String ugender;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: size.height,
//             width: size.width,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 colors: [
//                   Color.fromARGB(255, 17, 71, 234),
//                   Color.fromARGB(255, 50, 115, 228),
//                   Color.fromARGB(255, 88, 192, 233),
//                 ],
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.10,
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
//                   child: Text(
//                     "Create Profile",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 34,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.06,
//                 ),
//                 Expanded(
//                   child: Container(
//                     height: size.height,
//                     width: size.width,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(50),
//                           topRight: Radius.circular(50)),
//                     ),
//                     child: SingleChildScrollView(
//                       child: Container(
//                         margin: EdgeInsets.only(left: 25, right: 25),
//                         child: Column(
//                           children: <Widget>[
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.09,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(30),
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                       blurRadius: 10,
//                                       spreadRadius: 7,
//                                       offset: Offset(1, 1),
//                                       color: Colors.grey.withOpacity(0.3)),
//                                 ],
//                               ),
//                               child: TextField(
//                                 onChanged: (value) {
//                                   uname = value.toString().trim();
//                                 },
//                                 decoration: InputDecoration(
//                                     icon: Padding(
//                                       padding: const EdgeInsets.only(left: 20),
//                                       child: Icon(
//                                         Icons.person,
//                                         color: Color.fromARGB(149, 0, 0, 0),
//                                       ),
//                                     ),
//                                     hintText: "Enter Name",
//                                     hintStyle: TextStyle(color: Colors.grey),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide: BorderSide(
//                                             color: Colors.white, width: 1.0)),
//                                     enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide: BorderSide(
//                                             color: Colors.white, width: 1.0)),
//                                     border: OutlineInputBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(30))),
//                               ),
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.025,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(30),
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                       blurRadius: 10,
//                                       spreadRadius: 7,
//                                       offset: Offset(1, 1),
//                                       color: Colors.grey.withOpacity(0.3)),
//                                 ],
//                               ),
//                               child: TextField(
//                                 onChanged: (value) {
//                                   uemail = value.toString().trim();
//                                 },
//                                 keyboardType: TextInputType.emailAddress,
//                                 decoration: InputDecoration(
//                                     icon: Padding(
//                                       padding: const EdgeInsets.only(left: 20),
//                                       child: Icon(
//                                         Icons.email,
//                                         color: Color.fromARGB(149, 0, 0, 0),
//                                       ),
//                                     ),
//                                     hintText: "Enter Email",
//                                     hintStyle: TextStyle(color: Colors.grey),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide: BorderSide(
//                                             color: Colors.white, width: 1.0)),
//                                     enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide: BorderSide(
//                                             color: Colors.white, width: 1.0)),
//                                     border: OutlineInputBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(30))),
//                               ),
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.025,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(30),
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                       blurRadius: 10,
//                                       spreadRadius: 7,
//                                       offset: Offset(1, 1),
//                                       color: Colors.grey.withOpacity(0.3)),
//                                 ],
//                               ),
//                               child: TextField(
//                                 onChanged: (value) {
//                                   uage = value.toString().trim();
//                                 },
//                                 keyboardType: TextInputType.number,
//                                 decoration: InputDecoration(
//                                     icon: Padding(
//                                       padding: const EdgeInsets.only(left: 20),
//                                       child: Icon(
//                                         Icons.calendar_month,
//                                         color: Color.fromARGB(149, 0, 0, 0),
//                                       ),
//                                     ),
//                                     hintText: "Enter Age",
//                                     hintStyle: TextStyle(color: Colors.grey),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide: BorderSide(
//                                             color: Colors.white, width: 1.0)),
//                                     enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide: BorderSide(
//                                             color: Colors.white, width: 1.0)),
//                                     border: OutlineInputBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(30))),
//                               ),
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.025,
//                             ),
//                             _genderWidget(true, true),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.05,
//                             ),
//                             GestureDetector(
//                               child: Container(
//                                 height: 50,
//                                 width: size.width,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(30),
//                                   color: Color.fromARGB(255, 68, 167, 248),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     "Add Profile",
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                               onTap: (() async {
//                                 try {
//                                   await users
//                                       .doc(widget.userid as String?)
//                                       .set({
//                                     'name': uname,
//                                     'email': uemail,
//                                     'age': uage,
//                                     'gender': ugender
//                                   }).then(
//                                     (value) {
//                                       Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (BuildContext context) =>
//                                                   HomePage()));
//                                     },
//                                   );
//                                 } catch (e) {
//                                   print(e);
//                                 }
//                               }),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _genderWidget(bool _showOther, bool _alignment) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       alignment: Alignment.center,
//       child: GenderPickerWithImage(
//         showOtherGender: _showOther,
//         verticalAlignedText: _alignment,
//         onChanged: (Gender? gender) {
//           ugender =
//               gender.toString().substring(7, gender.toString().length).trim();
//         },
//         selectedGender: Gender.Male,
//         selectedGenderTextStyle:
//             TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//         unSelectedGenderTextStyle:
//             TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
//         equallyAligned: true,
//         size: 64,
//         animationDuration: Duration(seconds: 1),
//         isCircular: true,
//         opacityOfGradient: 0.4,
//         padding: EdgeInsets.all(10),
//       ),
//     );
//   }
// }
