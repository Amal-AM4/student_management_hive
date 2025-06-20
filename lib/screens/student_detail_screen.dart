import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/student_model.dart';

class StudentDetailScreen extends StatelessWidget {
  // const StudentDetailScreen({super.key});

  final int index;
  final StudentModel student;

  StudentDetailScreen({required this.index, required this.student});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _courseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = student.name;
    _ageController.text = student.age.toString();
    _courseController.text = student.course;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final newStudent = StudentModel(
                        name: _nameController.text,
                        age: int.parse(_ageController.text),
                        course: _courseController.text,
                      );

                      Hive.box<StudentModel>(
                        'studentsBox',
                      ).putAt(index, newStudent);
                      Navigator.pop(context);
                    },
                    child: Text('Update'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Hive.box<StudentModel>('studentsBox').deleteAt(index);
                      print('POS: $index');
                      Navigator.pop(context);
                    },
                    child: Text('Delete'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
