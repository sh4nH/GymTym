import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gymtym_login/pages/time_slot.dart';
import 'package:gymtym_login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TimeslotsPageDefault extends StatefulWidget {
  TimeslotsPageDefault({Key? key}) : super(key: key);

  @override
  State<TimeslotsPageDefault> createState() => _TimeslotsPageDefaultState();
}

class _TimeslotsPageDefaultState extends State<TimeslotsPageDefault> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(25),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(30),
              color: Colors.deepPurple,
              child: MaterialButton(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => TimeSlotPage()));
                  },
                  child: Text(
                    "Show timeslots",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
