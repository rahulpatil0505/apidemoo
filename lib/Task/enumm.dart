import 'package:flutter/material.dart';

class EnummmEXAMPLE extends StatefulWidget {
  const EnummmEXAMPLE({super.key});

  @override
  State<EnummmEXAMPLE> createState() => _EnummmEXAMPLEState();
}

class _EnummmEXAMPLEState extends State<EnummmEXAMPLE> {
  @override
  Widget build(BuildContext context) {
    Day today = Day.Friday;

    String dayString;
    switch (today) {
      case Day.Monday:
        dayString = 'Monday';
        break;
      case Day.Tuesday:
        dayString = 'Tuesday';
        break;
      case Day.Wednesday:
        dayString = 'Wednesday';
        break;
      case Day.Thursday:
        dayString = 'Thursday';
        break;
      case Day.Friday:
        dayString = 'Friday';
        break;
      case Day.Saturday:
        dayString = 'Saturday';
        break;
      case Day.Sunday:
        dayString = 'Sunday';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Enum"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Today is: $dayString'),
          ],
        ),
      ),
    );
  }
}

enum Day {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}
