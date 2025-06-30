import 'package:flutter/material.dart';

class ClassHomeScreen extends StatelessWidget {
  final int classNumber;

  const ClassHomeScreen({super.key, required this.classNumber});

  @override
  Widget build(BuildContext context) {
    final List<String> buttonLabels = [
      "Start Lesson",
      "Quick Quiz",
      "Daily Challenge",
      "Review Topics",
      "Leaderboard"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Class $classNumber"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: buttonLabels.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // 2 per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: () {
                // You can handle button clicks individually here
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("${buttonLabels[index]} clicked!"),
                ));
              },
              child: Text(buttonLabels[index]),
            );
          },
        ),
      ),
    );
  }
}
