import 'package:flutter/material.dart';
import 'display_box.dart';

class Report extends StatelessWidget {
  final double gpa;
  const Report({super.key, required this.gpa});

  @override
  Widget build(BuildContext context) {
    const tStyle1 = TextStyle(fontSize: 20);
    const tStyle2 = TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54);
    final double heightV = DisplayBox.list.length * 65;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "GPA: ${gpa.toStringAsFixed(4)}",
                style: const TextStyle(fontSize: 30),
              ),
              const Divider(
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(2),
                  3: FlexColumnWidth(1)
                },
                border: TableBorder.all(),
                children: [
                  const TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(child: Text("Course", style: tStyle2)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child:
                          Center(child: Text("Credit Hours", style: tStyle2)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(child: Text("Grade", style: tStyle2)),
                    )
                  ]),
                  for (var i in DisplayBox.list)
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                            child: Text(
                          i.name,
                          style: tStyle1,
                          textAlign: TextAlign.center,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                            child: Text(
                          i.creditHours.toString(),
                          style: tStyle1,
                          textAlign: TextAlign.center,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                            child: Text(
                          i.grade,
                          style: tStyle1,
                          textAlign: TextAlign.center,
                        )),
                      )
                    ]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
