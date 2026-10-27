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

  // 2. Додаємо професорів (демонстрація наслідування від Person)
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

  // 3. Створюємо курси (з prerequisites)
  final introCourse = Course(
    id: 'CS101',
    name: 'Основи програмування Dart',
    description: 'Базовий синтаксис та структури даних',
    credits: 5,
    instructor: prof.fullName,
  );
  final advancedCourse = Course(
    id: 'CS202',
    name: 'Архітектура мобільних додатків Flutter',
    description: 'Побудова кросплатформних додатків',
    credits: 6,
    instructor: prof.fullName,
    prerequisites: ['CS101'],
  );
  university.courses.addAll([introCourse, advancedCourse]);

  // 4. Додаємо студентів
  final s1 = Student(
    id: 'ST-01',
    firstName: 'Валерій',
    lastName: 'Антипкін',
    birthDate: DateTime(1990, 11, 15),
    skills: ['Dart', 'Flutter', 'C#', 'PostgreSQL', 'IoT'],
  );
  final s2 = Student(
    id: 'ST-02',
    firstName: 'Марія',
    lastName: 'Ковальчук',
    birthDate: DateTime(2004, 3, 22),
    skills: ['Dart', 'JavaScript', 'React'],
  );
  university.addStudent(s1);
  university.addStudent(s2);

  // 5. Записуємо студентів на курси та виставляємо оцінки
  s1.enrollInCourse('CS101');
  s1.addGrade('CS101', 96.0);

  // Перевіряємо, чи може студент записатися на CS202 після складання CS101
  if (advancedCourse.canStudentEnroll(s1)) {
    s1.enrollInCourse('CS202');
    s1.addGrade('CS202', 94.0);
  }

  s2.enrollInCourse('CS101');
  s2.addGrade('CS101', 55.0); // Не складено (< 60)

  // 6. Виводимо результати та статистику
  print('Професор (${prof.role}): $prof');
  print('Студент 1: $s1');
  print('Складені курси Валерія: ${s1.getPassedCourses()}');
  print('Студент 2: $s2');
  print('Чи може Марія записатися на CS202 (потрібен CS101 >= 60): ${advancedCourse.canStudentEnroll(s2)}');
  print('Доступні курси для Марії: ${university.getAvailableCoursesForStudent("ST-02")}');
  print('\nСтатистика університету:');
  print(university.generateStatistics());
}
