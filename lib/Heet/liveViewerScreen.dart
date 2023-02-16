import 'package:flutter/material.dart';

import '../Nitesh/liveScoreDoubles.dart';
import '../Nitesh/liveScoreSingles.dart';

class LiveViewerScreen extends StatefulWidget {
  const LiveViewerScreen({super.key});

  @override
  State<LiveViewerScreen> createState() => _LiveViewerScreenState();
}

class _LiveViewerScreenState extends State<LiveViewerScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                height: size.height,
                width: size.width,
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  // decoration: BoxDecoration(
                  //   color: Color.fromARGB(255, 50, 115, 228),
                  // ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            color: Color.fromARGB(255, 50, 115, 228),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TabBar(
                                controller: _tabController,
                                indicator: BoxDecoration(
                                  // color: Color.fromARGB(255, 50, 115, 228),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                // unselectedLabelColor:
                                //     Color.fromARGB(255, 50, 115, 228),
                                unselectedLabelColor: Colors.white,
                                // labelColor: Colors.white,
                                labelColor: Color.fromARGB(255, 50, 115, 228),
                                tabs: [
                                  Tab(
                                    text: 'Singles',
                                  ),
                                  Tab(
                                    text: 'Doubles',
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            LiveScoreSingles(),
                            LiveScoreDoubles(),
                          ],
                        ),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(30),
                      //     color: Colors.white,
                      //     boxShadow: [
                      //       BoxShadow(
                      //           blurRadius: 10,
                      //           spreadRadius: 7,
                      //           offset: Offset(1, 1),
                      //           color: Colors.grey.withOpacity(0.3)),
                      //     ],
                      //   ),
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //         icon: Padding(
                      //           padding: const EdgeInsets.only(left: 20),
                      //           child: Icon(
                      //             Icons.search,
                      //             color: Color.fromARGB(149, 0, 0, 0),
                      //           ),
                      //         ),
                      //         hintText: "Enter Event Code Or Match Name",
                      //         hintStyle: TextStyle(color: Colors.grey),
                      //         focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(30),
                      //             borderSide: BorderSide(
                      //                 color: Colors.white, width: 1.0)),
                      //         enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(30),
                      //             borderSide: BorderSide(
                      //                 color: Colors.white, width: 1.0)),
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(30))),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.02,
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(
                      //       left: MediaQuery.of(context).size.width * 0.7),
                      //   height: 50,
                      //   width: size.width,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(30),
                      //     color: Color.fromARGB(255, 3, 140, 252),
                      //   ),
                      //   child: Center(
                      //     child: Icon(
                      //       Icons.keyboard_arrow_right_sharp,
                      //       color: Colors.white,
                      //       size: 35,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.02,
                      // ),
                    ],
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
