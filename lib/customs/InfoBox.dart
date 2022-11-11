import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final double width;
  final double height = 200;
  const InfoBox({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final btnSize = 80 < (size.width) * 0.15 ? 80.0 : (size.width) * 0.15;
    const LinearGradient myGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromRGBO(59, 75, 91, 1),
        Color.fromRGBO(52, 46, 52, 1),
      ],
    );

    void clicker() {
      print("--->   Showed");
    }

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
                  const Expanded(
                    child: TextField(
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
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
                    children: const [
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
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
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
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
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: clicker,
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
