import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dart_basics_antupkin/models/student.dart';

Future<void> main() async {
  print('=== Dart Async Programming & File I/O Demo ===\n');
  await demonstrateFutures();
  await demonstrateStreams();
  await demonstrateFileOperations();
}

// 1. Симуляція асинхронного API запиту
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

// 2. Читання списку студентів з JSON файлу
Future<List<Student>> loadStudentsFromFile(String filename) async {
  final file = File(filename);
  if (!await file.exists()) return [];
  final content = await file.readAsString();
  final List<dynamic> decoded = jsonDecode(content) as List<dynamic>;
  return decoded
      .map((item) => Student.fromJson(item as Map<String, dynamic>))
      .toList();
}

// 3. Асинхронний запис списку студентів у JSON файл
Future<void> saveStudentsToFile(List<Student> students, String filename) async {
  final file = File(filename);
  final encoded = const JsonEncoder.withIndent('  ')
      .convert(students.map((s) => s.toJson()).toList());
  await file.writeAsString(encoded);
}

// 4. Генератор потоку даних (Stream async*)
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

// Демонстрація Futures, Future.wait та обробки помилок
Future<void> demonstrateFutures() async {
  print('--- 1. Futures, Future.wait & Error Handling ---');
  final stopwatch = Stopwatch()..start();
  try {
    // Паралельне виконання двох запитів
    final responses = await Future.wait([
      fetchStudentData('ST-101'),
      fetchStudentData('ST-102'),
    ]).timeout(const Duration(seconds: 3));

    stopwatch.stop();
    print('Паралельні запити виконано за ${stopwatch.elapsedMilliseconds} мс:');
    for (final r in responses) {
      print('  -> $r');
    }
  } catch (e) {
    print('Помилка виконання Future: $e');
  }
  print('');
}

// Демонстрація роботи з потоками (Stream та await for)
Future<void> demonstrateStreams() async {
  print('--- 2. Stream Operations Demo ---');
  final collected = <Student>[];
  await for (final student in studentStream()) {
    print('Отримано зі Stream: ${student.fullName} (GPA: ${student.gpa})');
    collected.add(student);
  }
  print('Загалом отримано студентів через поток: ${collected.length}\n');
}

// Демонстрація асинхронного читання/запису файлів (File I/O)
Future<void> demonstrateFileOperations() async {
  print('--- 3. Async JSON File I/O Demo ---');
  const filename = 'students_data.json';
  
  // Отримуємо студентів із потоку та конвертуємо в список
  final studentsToSave = await studentStream().toList();

  // Записуємо у файл
  await saveStudentsToFile(studentsToSave, filename);
  print('Дані успішно збережено у JSON файл: $filename');

  // Читаємо назад із файлу
  final loaded = await loadStudentsFromFile(filename);
  print('Прочитано студентів із файлу: ${loaded.length}');
  for (final s in loaded) {
    print('  * ${s.fullName} (Курсів: ${s.grades.keys.length})');
  }
  print('');
}