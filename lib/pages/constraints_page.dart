import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../model/user_model.dart';

class ConstraintsPage extends StatefulWidget {
  const ConstraintsPage({Key? key}) : super(key: key);

  @override
  State<ConstraintsPage> createState() => _ConstraintsPageState();
}

class _ConstraintsPageState extends State<ConstraintsPage> {
  String? uid = FirebaseAuth.instance.currentUser?.uid;

  List<bool> arr = [true, true, true, true, true, true, true, true, true, true];

  String daysProvider() {
    String days = "";
    for (var i = 0; i <= 6; i++) {
      if (arr[i]) {
        if (i == 0) {
          days += "mon,";
        } else if (i == 1) {
          days += "tue,";
        } else if (i == 2) {
          days += "wed,";
        } else if (i == 3) {
          days += "thu,";
        } else if (i == 4) {
          days += "fri,";
        } else if (i == 5) {
          days += "sat,";
        } else if (i == 6) {
          days += "sun";
        }
      }
    }
    if (days.length == 27) {
      days = "all";
    }
    if (days.substring(days.length - 1) == ',') {
      days = days.substring(0, days.length - 1);
    }
    return days;
  }

  String dayTimeProvider() {
    String dayTime = "";
    for (var i = 7; i <= 9; i++) {
      if (arr[i]) {
        if (i == 7) {
          dayTime += "Morning,";
        } else if (i == 8) {
          dayTime += "Afternoon,";
        } else if (i == 9) {
          dayTime += "Evening";
        }
      }
    }
    if (dayTime.length == 25) {
      dayTime = "All";
    }
    if (dayTime.substring(dayTime.length - 1) == ',') {
      dayTime = dayTime.substring(0, dayTime.length - 1);
    }
    return dayTime;
  }

  final url = 'http://gymtymapi.herokuapp.com/timeslots/usersettings/';

  void postData() async {
    try {
      final response = await post(Uri.parse(url), body: {
        "username": uid,
        "modslink": link,
        "days": daysProvider(),
        "day_time": dayTimeProvider(),
        "gym_name": value
      });
    } catch (er) {}
  }

  final gyms = ['UTown', 'MPSH', 'USC'];

  String value = 'UTown';

  String link = "None";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(22),
        children: [
          Text(
            "NUSMods Link: ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.schedule),
                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: "NUSMods Timetable Link",
                labelText: "Timetable Link",
                labelStyle: TextStyle(color: Colors.deepPurple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            keyboardType: TextInputType.url,
            onChanged: (text) {
              this.link = text;
            },
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.deepPurple,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Days of the Week : ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.deepPurple,
              title: Text(
                "Monday",
                style: TextStyle(fontSize: 15),
              ),
              value: arr[0],
              onChanged: (newVal) {
                setState(() {
                  arr[0] = newVal!;
                });
              }),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.deepPurple,
              title: Text(
                "Tuesday",
                style: TextStyle(fontSize: 15),
              ),
              value: arr[1],
              onChanged: (newVal) {
                setState(() {
                  arr[1] = newVal!;
                });
              }),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.deepPurple,
              title: Text(
                "Wednesday",
                style: TextStyle(fontSize: 15),
              ),
              value: arr[2],
              onChanged: (newVal) {
                setState(() {
                  arr[2] = newVal!;
                });
              }),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.deepPurple,
              title: Text(
                "Thursday",
                style: TextStyle(fontSize: 15),
              ),
              value: arr[3],
              onChanged: (newVal) {
                setState(() {
                  arr[3] = newVal!;
                });
              }),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.deepPurple,
              title: Text(
                "Friday",
                style: TextStyle(fontSize: 15),
              ),
              value: arr[4],
              onChanged: (newVal) {
                setState(() {
                  arr[4] = newVal!;
                });
              }),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.deepPurple,
              title: Text(
                "Saturday",
                style: TextStyle(fontSize: 15),
              ),
              value: arr[5],
              onChanged: (newVal) {
                setState(() {
                  arr[5] = newVal!;
                });
              }),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.deepPurple,
              title: Text(
                "Sunday",
                style: TextStyle(fontSize: 15),
              ),
              value: arr[6],
              onChanged: (newVal) {
                setState(() {
                  arr[6] = newVal!;
                });
              }),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.deepPurple,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Time of the day : ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.deepPurple,
              title: Text(
                "Morning (7-11AM)",
                style: TextStyle(fontSize: 15),
              ),
              value: arr[7],
              onChanged: (newVal) {
                setState(() {
                  arr[7] = newVal!;
                });
              }),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.deepPurple,
              title: Text(
                "Afternoon (12-4PM)",
                style: TextStyle(fontSize: 15),
              ),
              value: arr[8],
              onChanged: (newVal) {
                setState(() {
                  arr[8] = newVal!;
                });
              }),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.deepPurple,
              title: Text(
                "Evening (5-9PM)",
                style: TextStyle(fontSize: 15),
              ),
              value: arr[9],
              onChanged: (newVal) {
                setState(() {
                  arr[9] = newVal!;
                });
              }),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.deepPurple,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Gym Location : ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 2)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: value,
                //iconsize:
                items: gyms.map(buildMenuItem).toList(),
                onChanged: (value) {
                  setState(() {
                    this.value = value!;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            color: Colors.deepPurple,
            child: MaterialButton(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  postData();
                },
                child: Text(
                  "Save Changes",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
