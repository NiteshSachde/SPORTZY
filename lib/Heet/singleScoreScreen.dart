// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  var p1, p2;
  ScoreScreen({
    Key? mykey,
    required this.p1,
    required this.p2,
  }) : super(key: mykey);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  int _counterp1 = 0;
  int _counterp2 = 0;
  int _setCountp1 = 0;
  int _setCountp2 = 0;
  int _setNumber = 1;
  late int _swap1;
  late var _swapName;
  void _decrementCountP1() {
    setState(() {
      if (_counterp1 < 1) {
        return;
      }
      _counterp1--;
    });
  }

  void _decrementCountP2() {
    setState(() {
      if (_counterp2 < 1) {
        return;
      }
      _counterp2--;
    });
  }

  void _resetAll() {
    setState(() {
      _counterp1 = 0;
      _counterp2 = 0;
      _setCountp1 = 0;
      _setCountp2 = 0;
      _setNumber = 1;
    });
  }

  void _swapCourt() {
    setState(() {
      _swap1 = _counterp1;
      _counterp1 = _counterp2;
      _counterp2 = _swap1;

      _swap1 = _setCountp1;
      _setCountp1 = _setCountp2;
      _setCountp2 = _swap1;

      _swapName = widget.p1;
      widget.p1 = widget.p2;
      widget.p2 = _swapName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.033,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 15, 136, 236),
                  ),
                  child: Center(
                    child: Text(
                      '${widget.p1}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 15, 136, 236),
                  ),
                  child: Center(
                    child: Text(
                      '${widget.p2}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.025,
                ),
                GestureDetector(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 15, 136, 236),
                    ),
                    child: Center(
                      child: Text(
                        ("${_counterp1}"),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _counterp1++;

                      if (_counterp1 == 21) {
                        _counterp1 = 0;
                        _counterp2 = 0;
                        _setCountp1++;
                        _setNumber++;
                      }
                      if (_setCountp1 == 2 || _setCountp2 == 2) {
                        _setCountp1 = 0;
                        _setCountp2 = 0;
                        _setNumber = 1;
                      }
                    });
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                GestureDetector(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 15, 136, 236),
                    ),
                    child: Center(
                      child: Text(
                        ("${_counterp2}"),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: (() {
                    setState(() {
                      _counterp2++;

                      if (_counterp2 == 21) {
                        _counterp1 = 0;
                        _counterp2 = 0;
                        _setCountp2++;
                        _setNumber++;
                      }
                      if (_setCountp1 == 2 || _setCountp2 == 2) {
                        _setCountp1 = 0;
                        _setCountp2 = 0;
                        _setNumber = 1;
                      }
                    });
                  }),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.001,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 65,
                    ),
                    onPressed: _decrementCountP1,
                    color: Color.fromARGB(255, 15, 136, 236),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001,
                ),
                Text(
                  "Set " + "${_setNumber}",
                  style: TextStyle(fontSize: 26),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 65,
                    ),
                    color: Color.fromARGB(255, 15, 136, 236),
                    onPressed: _decrementCountP2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.21,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 15, 136, 236),
                  ),
                  child: Center(
                    child: Text(
                      ("${_setCountp1}"),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.21,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 15, 136, 236),
                  ),
                  child: Center(
                    child: Text(
                      ("${_setCountp2}"),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.19,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.06,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: null,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.swap_horiz_sharp,
                        size: 40,
                      ),
                      color: Color.fromARGB(255, 15, 136, 236),
                      onPressed: _swapCourt,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: null,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.replay,
                        size: 40,
                      ),
                      onPressed: _resetAll,
                      color: Color.fromARGB(255, 15, 136, 236),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
