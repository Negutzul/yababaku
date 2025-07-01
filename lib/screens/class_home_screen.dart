import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ClassHomeScreen extends StatefulWidget {
  final int classNumber;

  const ClassHomeScreen({super.key, required this.classNumber});

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
    final String jsonString =
        await rootBundle.loadString('lib/math/class_config.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    setState(() {
      buttonLabels = List<String>.from(
        jsonMap['buttons'].map((b) => b['label']),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class ${widget.classNumber}"),
        centerTitle: true,
      ),
      body: buttonLabels.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: buttonLabels.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.3,
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${buttonLabels[index]} clicked")),
                      );
                    },
                    child: Text(buttonLabels[index]),
                  );
                },
              ),
            ),
    );
  }
}