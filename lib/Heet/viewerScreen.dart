import 'package:flutter/material.dart';

class viewerScreen extends StatefulWidget {
  const viewerScreen({super.key});

  @override
  State<viewerScreen> createState() => _viewerScreenState();
}

class _viewerScreenState extends State<viewerScreen> {
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
