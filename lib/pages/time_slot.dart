import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymtym_login/pages/about_page.dart';
import 'package:gymtym_login/pages/constraints_page.dart';
import 'package:http/http.dart';
import 'day_slots.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TimeSlotPage extends StatefulWidget {
  TimeSlotPage({Key? key}) : super(key: key);

  @override
  State<TimeSlotPage> createState() => _TimeSlotPageState();
}

var list;

class _TimeSlotPageState extends State<TimeSlotPage> {
  final userId = (FirebaseAuth.instance.currentUser!.uid);

  _getData() async {
    try {
      final url2 = Uri.https(
          'gymtymapi.herokuapp.com', '/timeslots/gymtyms', {'user': userId});
      final response = await get(url2);

      Map<String, dynamic> map = json.decode(response.body);
      setState(() {
        list = map;
      });

      // ignore: empty_catches
    } catch (e) {}
    return list;
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        initialIndex: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text('Home', style: GoogleFonts.oswald()),
            centerTitle: true,
            bottom: TabBar(labelStyle: GoogleFonts.oswald(), tabs: [
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
            ]),
          ),
          body:
              TabBarView(children: [AboutPage(), ConstraintsPage(), ExpTile()]),
        ),
      ),
    );
  }

  Widget ExpTile() {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return Future(() {
            setState(() {});
          });
        },
        child: FutureBuilder(
          future: _getData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Invalid NUSMods Link\nSlide down to refresh",
                  style: TextStyle(color: Colors.deepOrange),
                ),
              );
            } else if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.deepPurple)));
            } else {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var dayTitle;
                  if (list.keys.elementAt(index).toString() == "mon") {
                    dayTitle = "Monday";
                  } else if (list.keys.elementAt(index).toString() == "tue") {
                    dayTitle = "Tuesday";
                  } else if (list.keys.elementAt(index).toString() == "wed") {
                    dayTitle = "Wednesday";
                  } else if (list.keys.elementAt(index).toString() == "thu") {
                    dayTitle = "Thursday";
                  } else if (list.keys.elementAt(index).toString() == "fri") {
                    dayTitle = "Friday";
                  } else if (list.keys.elementAt(index).toString() == "sat") {
                    dayTitle = "Saturday";
                  } else if (list.keys.elementAt(index).toString() == "sun") {
                    dayTitle = "Sunday";
                  }

                  return ExpansionTile(
                    title: Text(dayTitle),
                    children: DaySlotTile(
                        list[list.keys.elementAt(index).toString()]),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  List<Widget> DaySlotTile(List<dynamic> times) {
    List<Widget> children = [];
    for (var i = 0; i < times.length; i++) {
      children.add(DaySlots(start: times[i], end: times[i] + 1));
    }
    return children;
  }
}
