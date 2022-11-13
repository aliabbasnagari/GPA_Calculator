import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:gpa_calculator/customs/display_box.dart';
import 'customs/info_box.dart';
import 'customs/report.dart';

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

  final screenShotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(150, 251, 196, 1),
          appBar: AppBar(
            title: const Text("Home"),
            actions: [
              IconButton(
                onPressed: () async {
                  var image =
                      await screenShotController.captureFromWidget(Report(
                    gpa: gpa,
                  ));
                  await saveImage(image).then((value) => {
                        Fluttertoast.showToast(
                            msg: "Saved to Gallary !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black38,
                            textColor: Colors.white,
                            fontSize: 16.0)
                      });
                },
                icon: const Icon(Icons.save_alt),
              )
            ],
          ),
          body: Screenshot(
            controller: screenShotController,
            child: Column(
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
                  padding: const EdgeInsets.all(10.0),
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
      ),
    );
  }

  Future<String> saveImage(Uint8List image) async {
    await [Permission.storage].request();
    var time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '_')
        .replaceAll(':', '_');
    final ress =
        await ImageGallerySaver.saveImage(image, name: "Screenshot_$time");
    return ress['filePath'];
  }
}
