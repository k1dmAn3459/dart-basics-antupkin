import 'student.dart';
import 'course.dart';

class University {
  final String name;
  final List<Student> students = [];
  final List<Course> courses = [];

  University({required this.name});

  void addStudent(Student student) {
    if (!students.any((s) => s.id == student.id)) students.add(student);
  }

  void addCourse(Course course) {
    if (!courses.any((c) => c.id == course.id)) courses.add(course);
  }

  Student? findStudentById(String id) {
    for (final s in students) {
      if (s.id == id) return s;
    }
    return null;
  }

  List<Student> getTopStudents(double minAverage) =>
      students.where((s) => s.averageGrade >= minAverage).toList();
}
