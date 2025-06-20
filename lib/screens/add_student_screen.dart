import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/student_model.dart';

class AddStudentScreen extends StatelessWidget {
  // const AddStudentScreen({super.key});

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
            TextField(decoration: InputDecoration(labelText: 'Name')),
            TextField(
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(decoration: InputDecoration(labelText: 'Course')),
            SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: () {},
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
