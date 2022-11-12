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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double height = 200;

    final btnSize = 80 < (size.width) * 0.15 ? 80.0 : (size.width) * 0.15;
    const LinearGradient myGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromRGBO(59, 75, 91, 1),
        Color.fromRGBO(52, 46, 52, 1),
      ],
    );

    return SizedBox(
      height: height,
      child: Row(
        children: [
          Container(
            width: size.width * 0.7,
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
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controllerCname,
                      style: const TextStyle(
                        fontSize: 20,
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
                            fontSize: 20,
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
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          maxLength: 2,
                          controller: controllerGrade,
                          style: const TextStyle(
                            fontSize: 20,
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
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          String name = controllerCname.text.trim();
                          String chour = controllerChour.text.trim();
                          String grade = controllerGrade.text.trim();
                          if (name.isEmpty ||
                              chour.isEmpty ||
                              grade.isEmpty ||
                              !RegExp(r'^[0-9]+$').hasMatch(chour) ||
                              !RegExp(r'^[A-F-a-f---+]+$').hasMatch(grade)) {
                            showAlertDialog(context);
                            return;
                          }
                          grade = grade.toUpperCase();
                          DisplayBox.list.add(SubjectData(
                              name: name,
                              creditHours: double.parse(chour),
                              grade: grade));
                          widget.callBack();
                          controllerCname.text = "";
                          controllerChour.text = "";
                          controllerGrade.text = "";
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blueAccent,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black87,
                                blurRadius: 10,
                                offset: Offset(4, 4),
                              ),
                            ],
                          ),
                          width: btnSize,
                          height: btnSize,
                          child: const Icon(
                            Icons.add_rounded,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          controllerCname.text = "";
                          controllerChour.text = "";
                          controllerGrade.text = "";
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black87,
                                blurRadius: 10,
                                offset: Offset(4, 4),
                              ),
                            ],
                          ),
                          width: btnSize,
                          height: btnSize,
                          child: const Icon(
                            Icons.clear_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
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
