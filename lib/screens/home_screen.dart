import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/student_model.dart';

import 'add_student_screen.dart';
import 'student_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  // Good practice: Include a key in the constructor
  // const HomeScreen({Key? key}) : super(key: key);

  // Access the Hive box outside the build method for better performance and organization
  final studentsBox = Hive.box<StudentModel>('studentsBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( // Added const for better performance
          'Student List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: ValueListenableBuilder( // Added child: to SafeArea
          valueListenable: studentsBox.listenable(),
          builder: (context, Box<StudentModel> box, _) {
            if (box.isEmpty) {
              return const Center(child: Text("No Students Yet!")); // Added const
            }
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) { // Fix: Added context and index parameters
                final student = box.getAt(index)!;
                return ListTile(
                  title: Text(student.name),
                  subtitle: Text("Age: ${student.age} | Course: ${student.course} | State: ${student.state} | UUID: ${student.id}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StudentDetailScreen(index: index, student: student),
                      ),
                    );
                  },
                );
              }, // Fixed: Closing parenthesis for itemBuilder
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton( // Fix: floatingActionButton is a direct property of Scaffold
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddStudentScreen()),
          ); // Fix: Closing parenthesis for MaterialPageRoute
        },
        child: const Icon(Icons.add), // Added const
      ),
    );
  }
}