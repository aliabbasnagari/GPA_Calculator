import 'package:flutter/material.dart';
import 'display_box.dart';

class InfoBox extends StatefulWidget {
  final Function callBack;
  const InfoBox({super.key, required this.callBack});

  @override
  State<InfoBox> createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  var controllerCname = TextEditingController();
  var controllerChour = TextEditingController();
  var controllerGrade = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controllerCname.dispose();
    controllerChour.dispose();
    controllerGrade.dispose();
    super.dispose();
  }

  bool isValidGrade(String grade) {
    if (grade.isNotEmpty && grade.length < 3) {
      if ((grade.codeUnitAt(0) >= 65 && grade.codeUnitAt(0) <= 90) ||
          (grade.codeUnitAt(0) >= 97 && grade.codeUnitAt(0) <= 122)) {
        if (grade.length == 1) {
          return true;
        } else if (grade.codeUnitAt(1) == 43 || grade.codeUnitAt(1) == 45) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final mySize = MediaQuery.of(context).size;
    const double height = 180;

    //final btnSize = 80 < (size.width) * 0.15 ? 80.0 : (size.width) * 0.15;
    const LinearGradient myGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromRGBO(59, 75, 91, 1),
        Color.fromRGBO(52, 46, 52, 1),
      ],
    );

    return SizedBox(
      width: mySize.width,
      height: height,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: height,
              decoration: BoxDecoration(
                  gradient: myGradient,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 10,
                      offset: Offset(4, 4),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controllerCname,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromRGBO(255, 255, 255, 0.3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Course Name',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controllerChour,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.white),
                              filled: true,
                              fillColor: Color.fromRGBO(255, 255, 255, 0.3),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Credit Hours',
                            ),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            maxLength: 2,
                            controller: controllerGrade,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              counterText: "",
                              hintStyle: TextStyle(color: Colors.white),
                              filled: true,
                              fillColor: Color.fromRGBO(255, 255, 255, 0.3),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Grade',
                            ),
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    String name = controllerCname.text.trim();
                    String chour = controllerChour.text.trim();
                    String grade = controllerGrade.text.trim();
                    if (name.isEmpty ||
                        chour.isEmpty ||
                        grade.isEmpty ||
                        !RegExp(r'^[0-9-.]+$').hasMatch(chour) ||
                        !isValidGrade(grade)) {
                      showAlertDialog(context);
                      return;
                    }
                    grade = grade.toUpperCase();
                    DisplayBox.list.add(SubjectData(
                        name: name,
                        creditHours: double.parse(chour),
                        grade: grade));
                    widget.callBack();
                    FocusManager.instance.primaryFocus?.unfocus();
                    controllerCname.text = "";
                    controllerChour.text = "";
                    controllerGrade.text = "";
                  },
                  backgroundColor: Colors.blueAccent,
                  child: const Icon(
                    Icons.add_rounded,
                    size: 30,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    controllerCname.text = "";
                    controllerChour.text = "";
                    controllerGrade.text = "";
                  },
                  backgroundColor: Colors.red,
                  child: const Icon(
                    Icons.clear_rounded,
                    size: 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
    child: const Text("Ok"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
      Text("Invalid Data"),
      Icon(
        Icons.warning_rounded,
        color: Colors.red,
      )
    ]),
    content: const Text("Kindly enter correct data and try again."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
