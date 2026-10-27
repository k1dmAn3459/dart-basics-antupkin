import 'student.dart';

class Course {
  final String id;
  final String title;
  final int credits;
  final List<Student> enrolledStudents;

  Course({
    required this.id,
    required this.title,
    required this.credits,
    List<Student>? enrolledStudents,
  }) : enrolledStudents = enrolledStudents ?? [];

  void enrollStudent(Student student) {
    if (!enrolledStudents.any((s) => s.id == student.id)) {
      enrolledStudents.add(student);
    }
  }

  bool removeStudent(String studentId) {
    final initial = enrolledStudents.length;
    enrolledStudents.removeWhere((s) => s.id == studentId);
    return enrolledStudents.length < initial;
  }

  @override
  String toString() =>
      'Course($id: $title, credits: $credits, students: ${enrolledStudents.length})';
}
