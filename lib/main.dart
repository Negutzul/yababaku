import 'package:flutter/material.dart';
import 'screens/class_selection_screen.dart';
import 'screens/class_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Bytes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const EntryPoint(),
    );
  }
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return ClassSelectionScreen(
      onClassSelected: (selectedClass) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClassHomeScreen(),
          ),
        );
      },
    );
  }
}