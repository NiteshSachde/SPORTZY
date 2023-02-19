import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sportzy/Signup/Login/verifyEmail.dart';
import 'package:sportzy/Home/homeScreen.dart';
import 'ForgotPaswordPage.dart';
import 'SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();
  var _obscureText;
  var isVerified = false;

  checkIfVerified() async {
    if (user!.emailVerified == true) {
      setState(() {
        isVerified = true;
      });
    } else {
      setState(() {
        isVerified = false;
      });
    }
  }

  @override
  void initState() {
    _obscureText = true;
    checkIfVerified();
    super.initState();
  }

  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final emailField = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ("Please enter your email !");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email !");
        }
        return null;
      },
      onSaved: (value) {
        emailcontroller.text = value!.trim();
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 8),
          child: Icon(Icons.mail),
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        hintText: "Enter Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordcontroller,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login !");
        }
        if (!regex.hasMatch(value)) {
          return ("Password must contain minimum 6 character !");
        }
        return null;
      },
      onSaved: (value) {
        passwordcontroller.text = value!.trim();
      },
      textInputAction: TextInputAction.done,
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 8),
          child: Icon(Icons.lock),
        ),
        suffixIcon: IconButton(
          padding: EdgeInsetsDirectional.only(end: 12),
          icon: _obscureText
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
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
    final LoginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 50, 115, 228),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signIn(
            emailcontroller.text.trim(),
            passwordcontroller.text.trim(),
          );
        },
        child: Text(
          "Login",
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Expanded(
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/Sportzy_Blue_Final_Transparent.png',
                                width: 150,
                                height: 150,
                              ),
                              Text(
                                " Sportzy",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  emailField,
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  passwordField,
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0,
                                      vertical: 5,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        ForgotPasswordPage(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Forgot Password ? ',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                50,
                                                115,
                                                228,
                                              ),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  LoginButton,
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Don't have an account ? ",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  SignupScreen(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "SignUp",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              50,
                                              115,
                                              228,
                                            ),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
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
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (uid) => {
              if (isVerified)
                {
                  Fluttertoast.showToast(msg: "Login Successful !"),
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  ),
                }
              else
                {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => VerifyEmail(),
                    ),
                  ),
                }
            },
          )
          .catchError(
        (e) {
          // ignore: invalid_return_type_for_catch_error
          return Fluttertoast.showToast(msg: e!.message);
        },
      );
    }
  }
}
