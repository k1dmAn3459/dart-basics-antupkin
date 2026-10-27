import 'package:dart_basics_antupkin/models/student.dart';
import 'package:dart_basics_antupkin/utils/data_processor.dart';

void main() {
  print('=== Завдання 4: Колекції ===');
  final nums = [1, 2, 3, 4, 5, 6];
  print('Парні: ${DataProcessor.filterEvenNumbers(nums)}');
  final setA = {'Dart', 'Flutter'};
  final setB = {'Dart', 'SQL'};
  print('Перетин множин: ${setA.intersection(setB)}');
  print(
    'Частота слів: ${DataProcessor.wordFrequency("Dart is fast and Dart is cool")}',
  );
  final group = [
    Student(
      id: '1',
      firstName: 'Валерій',
      lastName: 'Антипкін',
      age: 20,
      grades: {'Dart': 95},
    ),
  ];
  print('Середній бал групи: ${DataProcessor.calculateGroupAverage(group)}');
}
