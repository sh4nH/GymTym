import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymtym_login/pages/login_page.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String text = "GymTym analyzes live traffic at NUS gyms continuously to provide you with the " +
      "least crowded timeslots- optimized according to your school timetable and constraints " +
      "such as your preferred time of the day and your preferred day of the week.\n" +
      "\nHead over to the Constraints Page and input your NUSMods Link (optional) with the constraints you " +
      "want, and then find the most optimal timeslots (ordered from least to most crowded) \n" +
      "in the Timeslots page.\n" +
      "\nIf you have any suggestions to improve the app, contact us @shanh2002 or @veggienav on telegram!";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: ListView(children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 50,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  )),
              Container(
                width: 15,
              ),
              Text(
                "GymTym",
                style: GoogleFonts.oswald(textStyle: TextStyle(fontSize: 38)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            text,
            style: GoogleFonts.oswald(textStyle: TextStyle(fontSize: 20)),
          ),
          SizedBox(
            height: 20,
          ),
          ActionChip(
              label: Text("Logout",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              onPressed: () {
                logout(context);
              }),
        ]),
      ),
    );
  }
}

Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
}
