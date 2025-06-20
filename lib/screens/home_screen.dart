import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/student_model.dart';

import 'add_student_screen.dart';
import 'student_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});

  final studentsBox = Hive.box<StudentModel>('studentsBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        ValueListenableBuilder(
          valueListenable: studentsBox.listenable(),
          builder: (context, Box<StudentModel> box, _) {
            if (box.isEmpty) return Center(child: Text("No Students Yet!"),);
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: () {
                final student = box.getAt(index)!;
                return ListTile(
                  title: Text(student.name),
                  subtitle: Text("Age: ${student.age} | Course: ${student.course} | State: ${student.state} | UUID: ${student.id}"),
                  onTap: () {
                    Navigator.push(context, 
                    MaterialPageRoute(
                      builder: (_) => StudentDetailScreen(index: index, student: student,)
                    ),
                    );
                  },
                ),
              });
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (_) => AddStudentScreen());
          )
        },
        child: Icon(Icons.add),
        )
      ),
    );
  }
}
