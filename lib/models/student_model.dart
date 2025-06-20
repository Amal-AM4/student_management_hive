// creating a model using hive db

import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
  final String id; // UUID as pk

  @HiveField(1)
  String name;

  @HiveField(2)
  int age;

  @HiveField(3)
  String course;

  @HiveField(4)
  String state;

  StudentModel({
    String? id,
    required this.name,
    required this.age,
    required this.course,
    this.state = 'Kerala',
  }) : id = id ?? const Uuid().v4(); // Auto-generate UUID if not provided
}