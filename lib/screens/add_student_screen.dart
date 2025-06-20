import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/student_model.dart';

class AddStudentScreen extends StatelessWidget {
  // const AddStudentScreen({super.key});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _courseController = TextEditingController();

  void addStudent(BuildContext context) {
    final name = _nameController.text;
    final age = int.tryParse(_ageController.text);
    final course = _courseController.text;

    if (name.isNotEmpty && age != null && course.isNotEmpty) {
      final student = StudentModel(name: name, age: age, course: course);
      Hive.box<StudentModel>('studentsBox').add(student);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Student',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _courseController,
              decoration: InputDecoration(labelText: 'Course'),
            ),
            SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: () => addStudent(context),
              child: Text('Add Student'),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ), // Blue border with a width of 2
                foregroundColor: Colors.blue, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
