import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sportzy/Models/userModel.dart';
import '../Nitesh/verifyEmail.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;
  // form key
  final _formKey = GlobalKey<FormState>();
  var _pobscureText;
  var _cpobscureText;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _pobscureText = true;
    _cpobscureText = true;
    super.initState();
  }

  // editing controller
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPassController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // name field
    final nameField = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Name cannot be empty !");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter valid name (Minimum 3 characters)");
        }
        return null;
      },
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          hintText: "Enter Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    // email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ("Please enter your email !");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email !");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!.trim();
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        hintText: "Enter Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
    // password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login !");
        }
        if (!regex.hasMatch(value)) {
          return ("Password must contain minimum 6 character !");
        }
      },
      onSaved: (value) {
        passwordController.text = value!.trim();
      },
      textInputAction: TextInputAction.done,
      obscureText: _pobscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          padding: EdgeInsetsDirectional.only(end: 12),
          icon: _pobscureText
              ? Icon(Icons.visibility)
              // ignore: dead_code
              : Icon(Icons.visibility_off),
          onPressed: () {
            setState(() {
              _pobscureText = !_pobscureText;
            });
          },
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
    // confirm password field
    final confirmpasswordField = TextFormField(
      autofocus: false,
      controller: confirmPassController,
      validator: (value) {
        if (confirmPassController.text != passwordController.text) {
          return "Passwords don't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPassController.text = value!.trim();
      },
      textInputAction: TextInputAction.done,
      obscureText: _cpobscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          padding: EdgeInsetsDirectional.only(end: 12),
          icon: _cpobscureText
              ? Icon(Icons.visibility)
              // ignore: dead_code
              : Icon(Icons.visibility_off),
          onPressed: () {
            setState(() {
              _cpobscureText = !_cpobscureText;
            });
          },
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
    // signUp button
    final SignupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 50, 115, 228),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (() {
          signUp(emailController.text.trim(), passwordController.text.trim());
        }),
        child: Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppBar(
                    leading: new IconButton(
                      icon: new Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    backgroundColor: Colors.transparent
                        .withOpacity(0.0), //You can make this transparent
                    elevation: 0.0, //No shadow
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    child: Text(
                      "Get Started !",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: Text(
                  "Welcome To Sportzy",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
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
                                      nameField,
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      emailField,
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      passwordField,
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      confirmpasswordField,
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                      ),
                                      SignupButton,
                                    ],
                                  )),
                            )
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
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Link has been sent to email !");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => VerifyEmail()),
        (route) => false);
  }
}
