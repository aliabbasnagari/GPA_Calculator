import 'package:flutter/material.dart';

class SubjectData {
  final String name;
  final String grade;
  final double creditHours;
  SubjectData(
      {required this.name, required this.creditHours, required this.grade});

  @override
  bool operator ==(Object other) {
    if (other is! SubjectData) return false;
    if (name != other.name) return false;
    if (grade != other.grade) return false;
    if (creditHours != other.creditHours) return false;
    return true;
  }
}

class DisplayBox extends StatelessWidget {
  static final list = [];
  final String name;
  final double credit;
  final String grade;
  final Function(DisplayBox, SubjectData) delCall;
  const DisplayBox(
      {super.key,
      required this.name,
      required this.credit,
      required this.grade,
      required this.delCall});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double height = 180;
    const LinearGradient myGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromRGBO(80, 167, 217, 1),
        Color.fromRGBO(113, 113, 190, 1),
      ],
    );

    var controllerCname = TextEditingController();
    var controllerChour = TextEditingController();
    var controllerGrade = TextEditingController();

    controllerCname.text = name;
    controllerChour.text = credit.toString();
    controllerGrade.text = grade;

    return Container(
      margin: const EdgeInsets.all(10),
      width: size.width,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controllerCname,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black),
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
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    delCall(
                        this,
                        SubjectData(
                            name: name, creditHours: credit, grade: grade));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red,
                    ),
                    width: 55,
                    height: 55,
                    child: const Icon(
                      Icons.clear_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: controllerChour,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, 0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
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
                    controller: controllerGrade,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, 0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
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
    );
  }
}
