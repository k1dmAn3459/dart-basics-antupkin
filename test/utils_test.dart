import 'package:test/test.dart';
import 'package:dart_basics_antupkin/utils/calculator.dart';
import 'package:dart_basics_antupkin/utils/data_processor.dart';
import 'package:dart_basics_antupkin/models/student.dart';

void main() {
  group('Utils Unit Tests', () {
    test('Calculator operations, factorial and fibonacci', () {
      expect(Calculator.add(10, 5), equals(15));
      expect(Calculator.factorial(5), equals(120));
      expect(Calculator.fibonacci(7), equals(13));
      expect(() => Calculator.divide(5, 0), throwsArgumentError);
    });

    test('DataProcessor collections methods', () {
      expect(DataProcessor.filterEvenNumbers([1, 2, 3, 4]), equals([2, 4]));
      expect(DataProcessor.countWords('Dart is cool and Dart is fast')['dart'], equals(2));

      final s1 = Student(
        id: '1',
        firstName: 'A',
        lastName: 'B',
        birthDate: DateTime(2004, 1, 1),
        enrolledCourses: ['C1', 'C2'],
        grades: {'C1': 90.0},
        skills: ['Dart'],
      );
      final s2 = Student(
        id: '2',
        firstName: 'C',
        lastName: 'D',
        birthDate: DateTime(2004, 5, 1),
        enrolledCourses: ['C1'],
        grades: {'C1': 80.0},
        skills: ['Flutter'],
      );

      expect(DataProcessor.findCommonCourses([s1, s2]), equals({'C1'}));
      expect(DataProcessor.getUniqueSkills([s1, s2]), equals({'Dart', 'Flutter'}));
      expect(DataProcessor.calculateAverageGradesByCourse([s1, s2])['C1'], equals(85.0));
    });
  });
}
