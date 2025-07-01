import 'package:flutter/material.dart';
import 'screens/class_home_screen.dart'; // rename it if needed

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Med Exam Prep',
      theme: ThemeData(useMaterial3: true),
      home: const ClassHomeScreen(), // use classNumber: 0 or ignore it for now
    );
  }
}