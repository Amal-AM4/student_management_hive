import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/student_model.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter());

  await Hive.openBox<StudentModel>('studentsBox'); // OR
  // Box<StudentModel> studentBox = Hive.box<StudentModel>('studentsBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'student Manager',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
