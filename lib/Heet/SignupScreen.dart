import 'package:flutter/material.dart';

import 'package:sportzy/Nitesh/loginScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();
  var _pobscureText;
  var _cpobscureText;
  @override
  void initState() {
    // TODO: implement initState
    _pobscureText = true;
    _cpobscureText = true;
    super.initState();
  }

  // editing controller
  final TextEditingController namecontroller = new TextEditingController();
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  final TextEditingController confirmpasscontroller =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // name field
    final nameField = TextFormField(
      autofocus: false,
      controller: namecontroller,
      keyboardType: TextInputType.emailAddress,
      // validator: (){},
      onSaved: (value) {
        namecontroller.text = value!;
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
      controller: emailcontroller,
      // validator: (){},
      onSaved: (value) {
        emailcontroller.text = value!;
      },
      textInputAction: TextInputAction.done,
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
      controller: passwordcontroller,
      // validator: (){},
      onSaved: (value) {
        passwordcontroller.text = value!;
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
      controller: confirmpasscontroller,
      // validator: (){},
      onSaved: (value) {
        confirmpasscontroller.text = value!;
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
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen()));
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
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
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Expanded(
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: Expanded(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Container(
                              child: Form(
                                  child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                  nameField,
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  emailField,
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  passwordField,
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  confirmpasswordField,
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
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
}
