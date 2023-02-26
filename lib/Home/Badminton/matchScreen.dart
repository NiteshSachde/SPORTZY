import 'package:flutter/material.dart';
import 'package:sportzy/Home/Badminton/completedScreen.dart';
import 'package:sportzy/Home/Badminton/liveScreen.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});
  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(initialIndex: 1, length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  height: 50,
                  child: Text(
                    "Completed",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  height: 50,
                  child: Text(
                    "Live",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CompletedScreen(),
                  LiveScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
