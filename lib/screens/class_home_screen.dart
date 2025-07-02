import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'subject_screen.dart'; // you'll make this next

class ClassHomeScreen extends StatefulWidget {
  const ClassHomeScreen({super.key});

  @override
  State<ClassHomeScreen> createState() => _ClassHomeScreenState();
}

class _ClassHomeScreenState extends State<ClassHomeScreen> {
  List<Map<String, String>> universityButtons = [];

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
        universityButtons = List<Map<String, String>>.from(
          map['universities'].map((e) => {
                'label': e['label'],
                'file': e['file'],
              }),
        );
      });
    } catch (e) {
      debugPrint('Failed to load config: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choose Your University")),
      body: universityButtons.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: universityButtons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final label = universityButtons[index]['label']!;
                  final file = universityButtons[index]['file']!;
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SubjectScreen(fileName: file),
                        ),
                      );
                    },
                    child: Text(label),
                  );
                },
              ),
            ),
    );
  }
}