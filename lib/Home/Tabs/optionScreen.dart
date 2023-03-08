import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sportzy/Home/TT/matchScreenTT.dart';
import '../Badminton/matchScreen.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});
  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              height: MediaQuery.of(context).size.height * 0.05,
            ),
             Lottie.asset(
                            'assets/images/129328-sport-fans-watching-match-on-tv.json',
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.14,
                        ),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
              child: Text(
                "View Live Matches",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Expanded(
              child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                       Lottie.asset(
                            'assets/images/64420-sports-animation-icon.json',
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        GestureDetector(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromARGB(255, 15, 136, 236),
                            ),
                            child: Center(
                              child: Text(
                                "Badminton",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return MatchScreen();
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                       Lottie.asset(
                            'assets/images/70664-olympics-table-tennis.json',
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        GestureDetector(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromARGB(255, 15, 136, 236),
                            ),
                            child: Center(
                              child: Text(
                                "Table Tennis",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return MatchScreenTT();
                                },
                              ),
                            );
                          },
                        ),
                      ],
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
}
