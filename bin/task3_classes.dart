import 'package:dart_basics_antupkin/models/student.dart';
import 'package:dart_basics_antupkin/models/course.dart';
import 'package:dart_basics_antupkin/models/university.dart';

void main() {
  print('=== Завдання 3: Класи та ООП ===');
  final uni = University(name: 'ІСТУ');
  final st = Student(
    id: 'S1',
    firstName: 'Валерій',
    lastName: 'Антипкін',
    age: 20,
    grades: {'Dart': 96, 'SQL': 92},
  );
  final course = Course(id: 'C1', title: 'Flutter Development', credits: 5);
  course.enrollStudent(st);
  uni.addStudent(st);
  uni.addCourse(course);
  print('Університет: ${uni.name}, Курс: $course');
  print('Відмінники: ${uni.getTopStudents(90.0)}');
}
