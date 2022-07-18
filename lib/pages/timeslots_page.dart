// ignore_for_file: unused_import, unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'timeslot.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymtym_login/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'day_slots.dart';

import 'login_page.dart';

class TimeSlotsPage extends StatelessWidget {
  const TimeSlotsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TimeSlots'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Card(
          shape: RoundedRectangleBorder(),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            // ignore: unnecessary_const, prefer_const_literals_to_create_immutables
            child: Column(children: [
              ExpansionTile(
                title: Text("Monday"),
                children: [
                  DaySlots(start: 7, end: 8),
                  DaySlots(start: 11, end: 12),
                  DaySlots(start: 14, end: 15),
                  DaySlots(start: 15, end: 16),
                  DaySlots(start: 15, end: 16),
                ],
              ),
              ExpansionTile(
                title: Text("Tuesday"),
                children: [
                  DaySlots(start: 7, end: 8),
                  DaySlots(start: 11, end: 12),
                  DaySlots(start: 14, end: 15),
                  DaySlots(start: 15, end: 16),
                  DaySlots(start: 15, end: 16),
                ],
              ),
              ExpansionTile(
                title: Text("Wednesday"),
                children: [
                  DaySlots(start: 7, end: 8),
                  DaySlots(start: 11, end: 12),
                  DaySlots(start: 14, end: 15),
                  DaySlots(start: 15, end: 16),
                  DaySlots(start: 15, end: 16),
                ],
              ),
              ExpansionTile(
                title: Text("Thursday"),
                children: [
                  DaySlots(start: 7, end: 8),
                  DaySlots(start: 11, end: 12),
                  DaySlots(start: 14, end: 15),
                  DaySlots(start: 15, end: 16),
                  DaySlots(start: 15, end: 16),
                ],
              ),
              ExpansionTile(
                title: Text("Friday"),
                children: [
                  DaySlots(start: 7, end: 8),
                  DaySlots(start: 11, end: 12),
                  DaySlots(start: 14, end: 15),
                  DaySlots(start: 15, end: 16),
                  DaySlots(start: 15, end: 16),
                ],
              ),
              ExpansionTile(
                title: Text("Saturday"),
                children: [
                  DaySlots(start: 7, end: 8),
                  DaySlots(start: 11, end: 12),
                  DaySlots(start: 14, end: 15),
                  DaySlots(start: 15, end: 16),
                  DaySlots(start: 15, end: 16),
                ],
              ),
              ExpansionTile(
                title: Text("Sunday"),
                children: [
                  DaySlots(start: 7, end: 8),
                  DaySlots(start: 11, end: 12),
                  DaySlots(start: 14, end: 15),
                  DaySlots(start: 15, end: 16),
                  DaySlots(start: 15, end: 16),
                ],
              ),
            ]),
          ),
        ),
      ),
    );

    // body: Column(
    //   children: [
    //     ListTile(
    //       leading: const Icon(Icons.schedule),
    //       title: const Text("Utown Gym"),
    //       subtitle: const Text("Monday, 17:00 - 18:30"),
    //       shape: RoundedRectangleBorder(
    //         side: const BorderSide(color: Colors.deepPurple, width: 1),
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //     ListTile(
    //       leading: const Icon(Icons.schedule),
    //       title: const Text("Utown Gym"),
    //       subtitle: const Text("Tuesday, 07:00 - 08:30"),
    //       shape: RoundedRectangleBorder(
    //         side: const BorderSide(color: Colors.deepPurple, width: 1),
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //     ListTile(
    //       leading: const Icon(Icons.schedule),
    //       title: const Text("Utown Gym"),
    //       subtitle: const Text("Wednesday, 10:00 - 12:30"),
    //       shape: RoundedRectangleBorder(
    //         side: const BorderSide(color: Colors.deepPurple, width: 1),
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //     ListTile(
    //       leading: const Icon(Icons.schedule),
    //       title: const Text("MPSH Gym"),
    //       subtitle: const Text("Thursday, 17:00 - 18:30"),
    //       shape: RoundedRectangleBorder(
    //         side: const BorderSide(color: Colors.deepPurple, width: 1),
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //     ListTile(
    //       leading: const Icon(Icons.schedule),
    //       title: const Text("MPSH Gym"),
    //       subtitle: const Text("Friday, 17:00 - 18:30"),
    //       shape: RoundedRectangleBorder(
    //         side: const BorderSide(color: Colors.deepPurple, width: 1),
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //   ],
    // )
  }
}

// class TimeSlotsPage extends StatefulWidget {
//   const TimeSlotsPage({Key? key}) : super(key: key);

//   @override
//   State<TimeSlotsPage> createState() => _TimeSlotsPageState();
// }

// class _TimeSlotsPageState extends State<TimeSlotsPage> {
//   @override
//   Widget build(BuildContext context) {
    // return Scaffold(
      // body: ExpansionPanelList(children: [
      //   ExpansionPanel(
      //       headerBuilder: ((context, isExpanded) {
      //         return const Scaffold(
      //           body: Text("Monday"),
      //         );
      //       }),
      //       body: const DaySlots(),
      //       isExpanded: false),
      //   ExpansionPanel(
      //       headerBuilder: ((context, isExpanded) {
      //         return const Scaffold(
      //           body: Text("Tuesday"),
      //         );
      //       }),
      //       body: const DaySlots(),
      //       isExpanded: false),
      // ]),
    // );
//     return Scaffold(
      // appBar: AppBar(
      //   title: const Text('TimeSlots'),
      //   centerTitle: true,
      //   backgroundColor: Colors.deepPurple,
//       ),
//     );
//   }
// }
