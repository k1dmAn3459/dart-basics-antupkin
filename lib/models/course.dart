import 'student.dart';

class Course {
  final String id;
  final String name;
  final String description;
  final int credits;
  final String instructor;
  final List<String> prerequisites;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.credits,
    required this.instructor,
    List<String>? prerequisites,
  }) : prerequisites = prerequisites ?? [];

  // Перевірка наявності попередніх вимог
  bool hasPrerequisites() => prerequisites.isNotEmpty;

  // Перевірка, чи склав студент усі необхідні попередні курси (оцінка >= 60)
  bool canStudentEnroll(Student student) {
    if (!hasPrerequisites()) return true;
    final passedCourses = student.getPassedCourses().toSet();
    return prerequisites.every((prereqId) => passedCourses.contains(prereqId));
  }

  @override
  String toString() {
    return 'Course($id: "$name", credits: $credits, instructor: $instructor, prereqs: $prerequisites)';
  }
}