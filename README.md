# Dart Basics — Практична робота

**Виконав:** студент Антипкін Валерій Павлович
**Мета роботи:** Опанувати основи синтаксису Dart (змінні, функції, ООП, колекції, асинхронність) через написання практичних програм та модульних тестів.

---

## 1. Встановлення Dart SDK

1. Встановіть Dart SDK (версія 3.0.0 або новіша) разом із Flutter SDK або з офіційного сайту [dart.dev](https://dart.dev/get-dart).
2. Перевірте встановлення у терміналі:
   ``bash
   dart --version
   ``n3. Клонуйте репозиторій та встановіть залежності:
   ``bash
   git clone [https://github.com/k1dmAn3459/dart-basics-antupkin.git](https://github.com/k1dmAn3459/dart-basics-antupkin.git)
   cd dart-basics-antupkin
   dart pub get
   ``n
---

## 2. Команди для запуску кожного завдання

* **Завдання 1 (Змінні та типи даних):**
  ``bash
  dart run bin/task1_variables.dart
  ``n* **Завдання 2 (Функції та замикання):**
  ``bash
  dart run bin/task2_functions.dart
  ``n* **Завдання 3 (Класи, ООП та моделі):**
  ``bash
  dart run bin/task3_classes.dart
  ``n* **Завдання 4 (Колекції та обробка даних):**
  ``bash
  dart run bin/task4_collections.dart
  ``n* **Завдання 5 (Асинхронне програмування):**
  ``bash
  dart run bin/task5_async.dart
  ``n* **Запуск модульних тестів та аналізатора:**
  ``bash
  dart test
  dart analyze
  ``n
---

## 3. Приклади використання створених класів

``dart
import 'package:dart_basics_antupkin/models/student.dart';
import 'package:dart_basics_antupkin/models/course.dart';
import 'package:dart_basics_antupkin/models/university.dart';

void main() {
  final uni = University(name: 'ІСТУ');
  final student = Student(
    id: 'S1',
    firstName: 'Валерій',
    lastName: 'Антипкін',
    age: 20,
    grades: {'Dart': 96, 'SQL': 92},
  );
  final course = Course(id: 'C1', title: 'Flutter Development', credits: 5);

  course.enrollStudent(student);
  uni.addStudent(student);
  uni.addCourse(course);

  print('Середній бал: ${student.averageGrade}');
}
``
