import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymtym_login/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class TimeSlotsPage extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TimeSlots'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text("Utown Gym"),
            subtitle: Text("Monday, 17:00 - 18:30"),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.deepPurple, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text("Utown Gym"),
            subtitle: Text("Tuesday, 07:00 - 08:30"),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.deepPurple, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),

          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text("Utown Gym"),
            subtitle: Text("Wednesday, 10:00 - 12:30"),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.deepPurple, width: 1),
              borderRadius: BorderRadius.circular(10),
            ), 
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text("MPSH Gym"),
            subtitle: Text("Thursday, 17:00 - 18:30"),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.deepPurple, width: 1),
              borderRadius: BorderRadius.circular(10),
            ), 

          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text("MPSH Gym"),
            subtitle: Text("Friday, 17:00 - 18:30"),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.deepPurple, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),

          ),
        ],
      )
    );
  }

}

