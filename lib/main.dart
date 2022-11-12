import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gpa_calculator/customs/display_box.dart';
import 'customs/info_box.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var gradesValue = {
    "A+": 4,
    "A": 4,
    "A-": 3.7,
    "B+": 3.3,
    "B": 3,
    "B-": 2.7,
    "C+": 2.3,
    "C": 2,
    "C-": 1.7,
    "D+": 1.3,
    "D": 1,
    "D-": 0.7,
    "F": 0,
  };
  double gpa = 0;
  var myData = [];

  void calculateGPA() {
    if (DisplayBox.list.isEmpty) {
      gpa = 0;
      return;
    }
    double totalGrade = 0;
    double totalCredit = 0;
    for (var item in DisplayBox.list) {
      var value = gradesValue[item.grade];
      if (value != null) {
        totalGrade += item.creditHours * value;
        totalCredit += item.creditHours;
      }
    }
    setState(() {
      gpa = totalGrade / totalCredit;
    });
  }

  void reb() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("Home")),
          body: Column(
            children: [
              Text(
                "GPA: ${gpa.toStringAsFixed(4)}",
                style: const TextStyle(fontSize: 40),
              ),
              const Divider(),
              Expanded(
                child: (myData.isNotEmpty)
                    ? ListView.builder(
                        itemCount: myData.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: myData[index],
                        ),
                      )
                    : const Text("NoData"),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InfoBox(callBack: () {
                  String name = DisplayBox.list.last.name;
                  double ch = DisplayBox.list.last.creditHours;
                  String grade = DisplayBox.list.last.grade;
                  setState(() {
                    myData.add(DisplayBox(
                      name: name,
                      credit: ch,
                      grade: grade,
                      delCall: ((p1, p2) {
                        DisplayBox.list
                            .removeWhere((element) => (element == p2));
                        myData.removeWhere((element) => element == p1);
                        setState(() {});
                        calculateGPA();
                        print(myData.length);
                        print(DisplayBox.list.length);
                      }),
                    ));
                    calculateGPA();
                  });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
