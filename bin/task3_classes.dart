import 'package:dart_basics_antupkin/models/student.dart';
import 'package:dart_basics_antupkin/models/course.dart';
import 'package:dart_basics_antupkin/models/university.dart';

void main() {
  print('=== University Management System Demo ===\n');
  runUniversityDemo();
}

void runUniversityDemo() {
  // 1. Створюємо університет
  final university = University(name: 'ІСТУ');

  // 2. Додаємо професора
  final prof = Professor(
    id: 'PR-01',
    firstName: 'Олександр',
    lastName: 'Мельник',
    birthDate: DateTime(1980, 5, 14),
    department: 'Інженерія програмного забезпечення',
    salary: 45000,
  );
  prof.assignCourse('CS101');
  prof.assignCourse('CS202');
  university.professors.add(prof);

  // 3. Створюємо курси (CS202 вимагає попереднього складання CS101)
  final basicCourse = Course(
    id: 'CS101',
    name: 'Основи мови Dart',
    description: 'Синтаксис, функції та ООП у Dart',
    credits: 5,
    instructor: prof.fullName,
  );
  final advancedCourse = Course(
    id: 'CS202',
    name: 'Розробка мобільних додатків на Flutter',
    description: 'Побудова UI та управління станом',
    credits: 6,
    instructor: prof.fullName,
    prerequisites: ['CS101'],
  );
  university.courses.addAll([basicCourse, advancedCourse]);

  // 4. Створюємо та додаємо студентів
  final s1 = Student(
    id: 'ST-01',
    firstName: 'Валерій',
    lastName: 'Антипкін',
    birthDate: DateTime(1990, 11, 15),
    skills: ['Dart', 'Flutter', 'C#', 'SQL'],
  );
  final s2 = Student(
    id: 'ST-02',
    firstName: 'Марія',
    lastName: 'Коваленко',
    birthDate: DateTime(2004, 4, 18),
    skills: ['Dart', 'JavaScript'],
  );
  university.addStudent(s1);
  university.addStudent(s2);

  // 5. Записуємо студентів на курси та виставляємо оцінки
  s1.enrollInCourse('CS101');
  s1.addGrade('CS101', 95.0);

  // Перевіряємо, чи може Валерій записатися на поглиблений курс CS202
  if (advancedCourse.canStudentEnroll(s1)) {
    s1.enrollInCourse('CS202');
    s1.addGrade('CS202', 92.0);
  }

  // Марія отримує 55 балів за CS101 (менше прохідних 60)
  s2.enrollInCourse('CS101');
  s2.addGrade('CS101', 55.0);

  // 6. Виводимо результати та статистику
  print('Викладач (${prof.role}): $prof');
  print('\nСтудент 1: $s1');
  print('Складені курси Валерія (>=60): ${s1.getPassedCourses()}');
  print('Серіалізація в JSON: ${s1.toJson()}');

  print('\nСтудент 2: $s2');
  print('Чи може Марія записатися на CS202: ${advancedCourse.canStudentEnroll(s2)}');
  print('Доступні курси для Марії: ${university.getAvailableCoursesForStudent("ST-02")}');

  print('\nЗагальна статистика університету:');
  print(university.generateStatistics());
}