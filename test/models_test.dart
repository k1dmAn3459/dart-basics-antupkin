import 'package:test/test.dart';
import 'package:dart_basics_antupkin/models/student.dart';
import 'package:dart_basics_antupkin/models/course.dart';
import 'package:dart_basics_antupkin/models/university.dart';

void main() {
  group('Models Unit Tests', () {
    test('Student GPA, passed courses and JSON serialization', () {
      final student = Student(
        id: 'S1',
        firstName: 'Валерій',
        lastName: 'Антипкін',
        birthDate: DateTime(2000, 1, 1),
      );
      student.addGrade('CS101', 95.0);
      student.addGrade('CS102', 50.0);

      expect(student.gpa, equals(72.5));
      expect(student.getPassedCourses(), equals(['CS101']));

      final json = student.toJson();
      final restored = Student.fromJson(json);
      expect(restored.fullName, equals('Валерій Антипкін'));
      expect(restored.gpa, equals(72.5));
    });

    test('Course prerequisites and University CRUD', () {
      final course = Course(
        id: 'CS201',
        name: 'Advanced Dart',
        description: 'OOP & Async',
        credits: 5,
        instructor: 'Dr. Smith',
        prerequisites: ['CS101'],
      );
      final student = Student(
        id: 'S1',
        firstName: 'Валерій',
        lastName: 'Антипкін',
        birthDate: DateTime(2000, 1, 1),
      );
      expect(course.canStudentEnroll(student), isFalse);

      student.addGrade('CS101', 85.0);
      expect(course.canStudentEnroll(student), isTrue);

      final uni = University(name: 'ІСТУ', courses: [course]);
      uni.addStudent(student);
      expect(uni.findStudentById('S1')?.fullName, equals('Валерій Антипкін'));
      expect(uni.getAvailableCoursesForStudent('S1').length, equals(1));
    });
  });
}
