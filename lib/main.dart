import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gpa_calculator/customs/displayBox.dart';
import 'customs/InfoBox.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DisplayBox(width: 0),
              InfoBox(width: 0),
            ],
          ),
        ),
      ),
    );
  }
}
