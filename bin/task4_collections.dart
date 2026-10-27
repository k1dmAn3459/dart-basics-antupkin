import 'dart:io';
import 'package:dart_basics_antupkin/models/student.dart';
import 'package:dart_basics_antupkin/models/course.dart';
import 'package:dart_basics_antupkin/models/university.dart';
import 'package:dart_basics_antupkin/utils/data_processor.dart';

void main() {
  print('=== Dart Collections & Data Processing Demo ===\n');
  demonstrateLists();
  demonstrateSets();
  demonstrateMaps();
  demonstrateAdvancedOperations();
}

// Тестовий набір даних студентів
List<Student> _getSampleStudents() {
  return [
    Student(
      id: 'S1',
      firstName: 'Валерій',
      lastName: 'Антипкін',
      birthDate: DateTime(1990, 11, 15),
      enrolledCourses: ['CS101', 'CS102'],
      grades: {'CS101': 96.0, 'CS102': 92.0},
      skills: ['Dart', 'Flutter', 'SQL', 'Docker'],
    ),
    Student(
      id: 'S2',
      firstName: 'Ігор',
      lastName: 'Бондаренко',
      birthDate: DateTime(2004, 7, 10),
      enrolledCourses: ['CS101', 'CS103'],
      grades: {'CS101': 84.0, 'CS103': 78.0},
      skills: ['Dart', 'React', 'Node.js'],
    ),
    Student(
      id: 'S3',
      firstName: 'Олена',
      lastName: 'Ткаченко',
      birthDate: DateTime(2004, 2, 19),
      enrolledCourses: ['CS101', 'CS102'],
      grades: {'CS101': 91.0, 'CS102': 89.0},
      skills: ['Dart', 'Flutter', 'Python'],
    ),
  ];
}

void demonstrateLists() {
  print('--- 1. Lists Demo ---');
  final numbers = [14, 7, 22, 9, 31, 40, 18];
  final evens = DataProcessor.filterEvenNumbers(numbers);
  final sum = numbers.reduce((a, b) => a + b);

  print('Парні числа: $evens | Сума: $sum');
  print('Сортування студентів за GPA: ${DataProcessor.sortStudentsByGPA(_getSampleStudents())}\n');
}

void demonstrateSets() {
  print('--- 2. Sets Demo ---');
  final students = _getSampleStudents();
  print('Унікальні навички всіх студентів (Union): ${DataProcessor.getUniqueSkills(students)}');
  print('Спільні курси студентів (Intersection): ${DataProcessor.findCommonCourses(students)}\n');
}

void demonstrateMaps() {
  print('--- 3. Maps Demo ---');
  final students = _getSampleStudents();
  final byYear = DataProcessor.groupStudentsByYear(students);
  
  print('Групування за роком народження:');
  byYear.forEach((year, list) {
    print('   Рік $year: ${list.map((s) => s.fullName).toList()}');
  });
  print('Середній бал по курсах: ${DataProcessor.calculateAverageGradesByCourse(students)}\n');
}

void demonstrateAdvancedOperations() {
  print('--- 4. CSV Data Analysis & Advanced Report (Deliverable 4.3) ---');
  final students = _getSampleStudents();
  final uni = University(
    name: 'ІСТУ',
    students: students,
    courses: [
      Course(id: 'CS101', name: 'Dart Basics', description: 'Core', credits: 4, instructor: 'Мельник О.'),
      Course(id: 'CS102', name: 'Flutter UI', description: 'UI', credits: 5, instructor: 'Мельник О.'),
    ],
  );

  // Створюємо демонстраційний CSV файл
  final csvFile = File('students_sample.csv');
  final csvBuffer = StringBuffer('id,fullName,birthYear,gpa\n');
  for (final s in students) {
    csvBuffer.writeln('${s.id},${s.fullName},${s.birthDate.year},${s.gpa.toStringAsFixed(2)}');
  }
  csvFile.writeAsStringSync(csvBuffer.toString());

  // Читаємо і аналізуємо CSV файл
  final lines = csvFile.readAsLinesSync().skip(1);
  print('Зчитано рядків із CSV файлу (${csvFile.path}): ${lines.length}');
  
  final report = DataProcessor.generateReport(uni);
  print('Згенерований звіт університету по курсах:');
  for (final row in report) {
    print('  - Курс: ${row["courseName"]} | Студентів: ${row["enrolledCount"]} | Середній бал: ${row["averageGrade"]}');
  }
  print('');
}