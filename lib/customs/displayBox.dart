import 'package:flutter/material.dart';

class DisplayBox extends StatelessWidget {
  final double width;
  final double height = 200;
  const DisplayBox({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const LinearGradient myGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromRGBO(80, 167, 217, 1),
        Color.fromRGBO(113, 113, 190, 1),
      ],
    );

    return Row(
      children: [
        Container(
          width: size.width - 40,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
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
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: null,
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
                  children: const [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
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
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
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
        ),
      ],
    );
  }
}
