import 'package:flutter/material.dart';
import 'package:hamalab_cmb_ott_app/screen/bottom_bar.dart';
import 'package:hamalab_cmb_ott_app/screen/home/home_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _Home_Page createState() => _Home_Page();
}

class _Home_Page extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'rainbow',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
      ),
      home: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: [
            Home(),
            Container(child: Center(child: Text("카테고리"))),
            Container(child: Center(child: Text("히스토리"))),
            Container(child: Center(child: Text("마이"))),
          ],
        ),
        bottomNavigationBar: BottomBar(tabController: _tabController),
      ),
    );
  }
}

