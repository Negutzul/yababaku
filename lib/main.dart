import 'package:flutter/material.dart';
import 'screens/class_selection_screen.dart';

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
      home: ClassSelectionScreen(
        onClassSelected: (selectedClass) {
          // You can replace this with navigation to the next screen
          print("User selected Class $selectedClass");
        },
      ),
    );
  }
}