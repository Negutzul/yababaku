import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ClassHomeScreen extends StatefulWidget {
  const ClassHomeScreen({super.key});

  @override
  State<ClassHomeScreen> createState() => _ClassHomeScreenState();
}

class _ClassHomeScreenState extends State<ClassHomeScreen> {
  List<String> buttonLabels = [];

  @override
  void initState() {
    super.initState();
    loadConfig();
  }

  Future<void> loadConfig() async {
    try {
      final jsonString = await rootBundle.loadString('lib/medicine/class_config.json');
      final Map<String, dynamic> map = json.decode(jsonString);
      setState(() {
        buttonLabels = List<String>.from(map['buttons'].map((b) => b['label']));
      });
    } catch (e) {
      debugPrint('Failed to load config: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Med Exam Prep")),
      body: buttonLabels.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: buttonLabels.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (context, i) {
                  return ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${buttonLabels[i]} clicked")),
                      );
                    },
                    child: Text(buttonLabels[i]),
                  );
                },
              ),
            ),
    );
  }
}