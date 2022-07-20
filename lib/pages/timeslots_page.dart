import 'package:flutter/material.dart';
import 'day_slots.dart';

class TimeSlotsPage extends StatelessWidget {
  const TimeSlotsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  }
}
