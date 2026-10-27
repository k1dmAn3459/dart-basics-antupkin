import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dart_basics_antupkin/models/student.dart';

Future<void> main() async {
  print('=== Dart Async Programming Demo ===\n');
  await demonstrateFutures();
  await demonstrateStreams();
  await demonstrateFileOperations();
}

Future<String> fetchStudentData(String studentId) async {
  await Future.delayed(const Duration(milliseconds: 300));
  if (studentId.isEmpty) {
    throw ArgumentError('ID студента не може бути порожнім');
  }
  return jsonEncode({
    'id': studentId,
    'status': 'verified',
    'timestamp': DateTime.now().toIso8601String(),
  });
}

Future<List<Student>> loadStudentsFromFile(String filename) async {
  final file = File(filename);
  if (!await file.exists()) return [];
  final content = await file.readAsString();
  final List<dynamic> decoded = jsonDecode(content) as List<dynamic>;
  return decoded
      .map((item) => Student.fromJson(item as Map<String, dynamic>))
      .toList();
}

Future<void> saveStudentsToFile(List<Student> students, String filename) async {
  final file = File(filename);
  final encoded = const JsonEncoder.withIndent('  ')
      .convert(students.map((s) => s.toJson()).toList());
  await file.writeAsString(encoded);
}

Stream<Student> studentStream() async* {
  final sample = [
    Student(
      id: 'ST-101',
      firstName: 'Валерій',
      lastName: 'Антипкін',
      birthDate: DateTime(1990, 11, 15),
      grades: {'Dart': 96.0, 'Flutter': 95.0},
    ),
    Student(
      id: 'ST-102',
      firstName: 'Андрій',
      lastName: 'Шевченко',
      birthDate: DateTime(2003, 8, 12),
      grades: {'Dart': 88.0, 'Flutter': 91.0},
    ),
  ];

  for (final s in sample) {
    await Future.delayed(const Duration(milliseconds: 200));
    yield s;
  }
}

Future<void> demonstrateFutures() async {
  print('--- 1. Futures, Future.wait & Timeouts ---');
  final stopwatch = Stopwatch()..start();
  try {
    final responses = await Future.wait([
      fetchStudentData('ST-101'),
      fetchStudentData('ST-102'),
    ]).timeout(const Duration(seconds: 3));

    stopwatch.stop();
    print('Паралельний запит виконано за ${stopwatch.elapsedMilliseconds} мс:');
    for (final r in responses) {
      print('  -> $r');
    }
  } catch (e) {
    print('Помилка виконання Future: $e');
  }
  print('');
}

Future<void> demonstrateStreams() async {
  print('--- 2. Streams Demo ---');
  final collected = <Student>[];
  await for (final student in studentStream()) {
    print('Отримано зі Stream: ${student.fullName} (GPA: ${student.gpa})');
    collected.add(student);
  }
  print('');
}

Future<void> demonstrateFileOperations() async {
  print('--- 3. Async JSON File I/O Demo ---');
  const filename = 'students_data.json';
  final studentsToSave = await studentStream().toList();

  await saveStudentsToFile(studentsToSave, filename);
  print('Дані збережено у файл: $filename');

  final loaded = await loadStudentsFromFile(filename);
  print('Успішно прочитано з JSON файлу студентів: ${loaded.length}');
  for (final s in loaded) {
    print('  * $s');
  }
}
