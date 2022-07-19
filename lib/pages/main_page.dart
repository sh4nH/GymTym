import 'package:firebase_auth/firebase_auth.dart';
import 'package:gymtym_login/pages/about_page.dart';
import 'package:gymtym_login/pages/constraints_page.dart';
import 'package:gymtym_login/pages/timeslots_default_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Home'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Constraints',
                icon: Icon(Icons.analytics_sharp),
              ),
              Tab(
                text: 'Timeslots',
                icon: Icon(Icons.alarm_rounded),
              ),
              Tab(
                text: 'About',
                icon: Icon(Icons.aod_rounded),
              )
            ],
          ),
        ),
        body: TabBarView(
            children: [ConstraintsPage(), TimeslotsPageDefault(), AboutPage()]),
      ),
    );
  }
}
