import 'package:flutter/material.dart';

class DaySlots extends StatefulWidget {
  final int start;
  final int end;
  const DaySlots({Key? key, required this.start, required this.end})
      : super(key: key);

  @override
  State<DaySlots> createState() => _DaySlotsState();
}

class _DaySlotsState extends State<DaySlots> {
  @override
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.schedule),
      title: Text(" ${widget.start}:00 To ${widget.end}:00"),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.deepPurple, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
