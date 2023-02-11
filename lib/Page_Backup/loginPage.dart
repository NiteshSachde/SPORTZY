// // ignore_for_file: file_names

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:gender_picker/source/enums.dart';
// import 'package:gender_picker/source/gender_picker.dart';
// // import 'package:sportzy/Heet/HomePage.dart';
// // import 'package:sportzy/Heet/profile.dart';
// import 'package:sportzy/Page_Backup/verifyOtp.dart';
// // import './signUpPage.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//   static String verify = "";
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   var phone = "";

//   late String uname;
//   late String uemail;
//   late var uage;
//   late String ugender;
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
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.08,
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
//                   child: Text(
//                     "Get Started !",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
//               child: Text(
//                 "Welcome To Sportzy",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.04,
//             ),
//             Expanded(
//               child: Container(
//                 height: size.height,
//                 width: size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30)),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Container(
//                     margin: EdgeInsets.only(left: 25, right: 25),
//                     child: Column(
//                       children: <Widget>[
//                         // SizedBox(
//                         //   height: MediaQuery.of(context).size.height * 0.04,
//                         // ),
//                         // Row(
//                         //   mainAxisAlignment: MainAxisAlignment.start,
//                         //   children: [
//                         //     Image.asset(
//                         //       'assets/images/Sportzy_Blue_Final_Transparent.png',
//                         //       width: 150,
//                         //       height: 150,
//                         //     ),
//                         //     Text(
//                         //       " Sportzy",
//                         //       style: TextStyle(
//                         //           color: Colors.black,
//                         //           fontSize: 36,
//                         //           fontWeight: FontWeight.bold),
//                         //     ),
//                         //     SizedBox(
//                         //       width: MediaQuery.of(context).size.width * 0.04,
//                         //     ),
//                         //   ],
//                         // ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.05,
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
//                             onChanged: (value) {
//                               phone = value;
//                             },
//                             keyboardType: TextInputType.phone,
//                             decoration: InputDecoration(
//                                 icon: Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: Icon(
//                                     Icons.phone,
//                                     color: Color.fromARGB(149, 0, 0, 0),
//                                   ),
//                                 ),
//                                 hintText: "Phone Number",
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
//                             onChanged: (value) {
//                               uname = value.toString().trim();
//                             },
//                             decoration: InputDecoration(
//                                 icon: Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: Icon(
//                                     Icons.person,
//                                     color: Color.fromARGB(149, 0, 0, 0),
//                                   ),
//                                 ),
//                                 hintText: "Enter Name",
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
//                             onChanged: (value) {
//                               uemail = value.toString().trim();
//                             },
//                             keyboardType: TextInputType.emailAddress,
//                             decoration: InputDecoration(
//                                 icon: Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: Icon(
//                                     Icons.email,
//                                     color: Color.fromARGB(149, 0, 0, 0),
//                                   ),
//                                 ),
//                                 hintText: "Enter Email",
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
//                             onChanged: (value) {
//                               uage = value.trim();
//                             },
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                                 icon: Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: Icon(
//                                     Icons.calendar_month,
//                                     color: Color.fromARGB(149, 0, 0, 0),
//                                   ),
//                                 ),
//                                 hintText: "Enter Age",
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

//                         _genderWidget(true, true),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.02,
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
//                                 "Send OTP",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           onTap: (() async {
//                             try {
//                               await FirebaseAuth.instance.verifyPhoneNumber(
//                                 phoneNumber: '+91${phone}',
//                                 verificationCompleted:
//                                     (PhoneAuthCredential credential) {},
//                                 verificationFailed:
//                                     (FirebaseAuthException e) {},
//                                 codeSent:
//                                     (String verificationId, int? resendToken) {
//                                   LoginPage.verify = verificationId;
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => VerifyOtp(
//                                                 unumber: phone,
//                                                 uname: uname.toString(),
//                                                 uemail: uemail,
//                                                 uage: uage,
//                                                 ugender: ugender,
//                                               )));
//                                 },
//                                 codeAutoRetrievalTimeout:
//                                     (String verificationId) {},
//                               );
//                             } catch (e) {
//                               print('Something went wrong !');
//                               ;
//                             }
//                           }),
//                           // onTap: () {
//                           //   Navigator.push(
//                           //       context,
//                           //       MaterialPageRoute(
//                           //           builder: (context) => Profile()));
//                           // },
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03,
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
