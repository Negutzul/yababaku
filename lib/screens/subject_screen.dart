import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class SubjectScreen extends StatefulWidget {
  final String fileName;

  const SubjectScreen({super.key, required this.fileName});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  List<String> subjects = [];

  @override
  void initState() {
    super.initState();
    loadSubjects();
  }

  Future<void> loadSubjects() async {
    try {
      final jsonString = await rootBundle.loadString('lib/medicine/${widget.fileName}');
      final Map<String, dynamic> map = json.decode(jsonString);
      setState(() {
        subjects = List<String>.from(map['subjects'].map((s) => s['label']));
      });
    } catch (e) {
      debugPrint('Failed to load subjects from ${widget.fileName}: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.fileName.replaceAll(".json", ""))),
      body: subjects.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${subjects[index]} clicked")),
                      );
                    },
                    child: Text(subjects[index]),
                  ),
                );
              },
            ),
    );
  }
}