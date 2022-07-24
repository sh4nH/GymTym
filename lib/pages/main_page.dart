import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
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
          title: Text(
            'Home',
            style: GoogleFonts.oswald(),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelStyle: GoogleFonts.oswald(),
            tabs: [
              Tab(
                text: 'About',
                icon: Icon(Icons.aod_rounded),
              ),
              Tab(
                text: 'Constraints',
                icon: Icon(Icons.analytics_sharp),
              ),
              Tab(
                text: 'Timeslots',
                icon: Icon(Icons.alarm_rounded),
              ),
            ],
          ),
        ),
        body: TabBarView(
            children: [AboutPage(), ConstraintsPage(), TimeslotsPageDefault()]),
      ),
    );
  }
}
