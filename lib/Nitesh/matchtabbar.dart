import 'package:flutter/material.dart';

import '../Heet/liveViewerScreen.dart';

class MatchTabBar extends StatefulWidget {
  const MatchTabBar({super.key});

  @override
  State<MatchTabBar> createState() => _MatchTabBarState();
}

class _MatchTabBarState extends State<MatchTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 1);

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
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
                child: Text(
                  "Search Matches",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
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
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TabBar(
                              controller: _tabController,
                              indicator: BoxDecoration(
                                color: Color.fromARGB(255, 50, 115, 228),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              unselectedLabelColor:
                                  Color.fromARGB(255, 50, 115, 228),
                              tabs: [
                                Tab(
                                  text: 'Previous',
                                ),
                                Tab(
                                  text: 'Live',
                                ),
                              ]),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Center(
                              child: Text('Previous Matches'),
                            ),
                            LiveViewerScreen(),
                          ],
                        ),
                      ),
                    ],
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
