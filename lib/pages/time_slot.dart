import 'dart:convert';
import 'package:flutter/material.dart';
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

  Future<Map<String, dynamic>> _getData() async {
    try {
      final url2 = Uri.https(
          'gymtymapi.herokuapp.com', '/timeslots/gymtyms', {'user': userId});
      final response = await get(url2);

      Map<String, dynamic> map = json.decode(response.body);
      list = map;

      // ignore: empty_catches
    } catch (e) {
      print(e);
    }
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
            title: Text('Home'),
            centerTitle: true,
            bottom: TabBar(tabs: [
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
    return FutureBuilder(
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
            itemCount: list == null ? 0 : list.length,
            itemBuilder: (context, index) {
              var day;
              var dayTitle;
              if (index == 0) {
                day = "mon";
                dayTitle = "Monday";
              } else if (index == 1) {
                day = "tue";
                dayTitle = "Tuesday";
              } else if (index == 2) {
                day = "wed";
                dayTitle = "Wednesday";
              } else if (index == 3) {
                day = "thu";
                dayTitle = "Thursday";
              } else if (index == 4) {
                day = "fri";
                dayTitle = "Friday";
              } else if (index == 5) {
                day = "sat";
                dayTitle = "Saturday";
              } else if (index == 6) {
                day = "sun";
                dayTitle = "Sunday";
              }
              return ExpansionTile(
                title: Text(dayTitle),
                children: DaySlotTile(list[day]),
              );
            },
          );
        }
      },
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
