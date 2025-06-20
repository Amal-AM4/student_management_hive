import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/student_model.dart';

class StudentDetailScreen extends StatelessWidget {
  // const StudentDetailScreen({super.key});

  final int index;
  final StudentModel student;

  StudentDetailScreen({required this.index, required this.student});

  @override
  Widget build(BuildContext context) {
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
              TextField(decoration: InputDecoration(labelText: 'Name')),
              TextField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              TextField(decoration: InputDecoration(labelText: 'Course')),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Update')),
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
