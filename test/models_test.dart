import 'package:test/test.dart';
import 'package:dart_basics_antupkin/models/student.dart';
import 'package:dart_basics_antupkin/models/course.dart';
import 'package:dart_basics_antupkin/models/university.dart';

void main() {
  test('Student, Course and University models test', () {
    final s = Student(
      id: '1',
      firstName: 'Валерій',
      lastName: 'Антипкін',
      age: 20,
    );
    s.addGrade('Dart', 90);
    s.addGrade('SQL', 100);
    expect(s.averageGrade, equals(95.0));
    final c = Course(id: 'C1', title: 'Dart', credits: 5);
    c.enrollStudent(s);
    expect(c.enrolledStudents.length, equals(1));
    final u = University(name: 'ІСТУ');
    u.addStudent(s);
    expect(u.findStudentById('1')?.fullName, equals('Валерій Антипкін'));
  });
}
