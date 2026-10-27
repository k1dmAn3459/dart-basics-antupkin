import 'student.dart';
import 'course.dart';

// Абстрактний базовий клас
abstract class Person {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;

  Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
  });

  String get fullName => '$firstName $lastName';

  int get age {
    final now = DateTime.now();
    int years = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      years--;
    }
    return years;
  }

  String get role; // Абстрактний геттер
}

// Клас Professor успадковує Person
class Professor extends Person {
  final String department;
  final List<String> taughtCourses;
  final double salary;

  Professor({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.birthDate,
    required this.department,
    required this.salary,
    List<String>? taughtCourses,
  }) : taughtCourses = taughtCourses ?? [];

  @override
  String get role => 'Professor';

  // Специфічні методи професора
  void assignCourse(String courseId) {
    if (!taughtCourses.contains(courseId)) {
      taughtCourses.add(courseId);
    }
  }

  bool teachesCourse(String courseId) => taughtCourses.contains(courseId);

  @override
  String toString() {
    return 'Professor($id: $fullName, dept: "$department", courses: $taughtCourses)';
  }
}

// Система управління університетом
class University {
  final String name;
  final List<Student> students;
  final List<Professor> professors;
  final List<Course> courses;

  University({
    required this.name,
    List<Student>? students,
    List<Professor>? professors,
    List<Course>? courses,
  })  : students = students ?? [],
        professors = professors ?? [],
        courses = courses ?? [];

  // CRUD операції
  void addStudent(Student student) {
    if (!students.any((s) => s.id == student.id)) {
      students.add(student);
    }
  }

  void removeStudent(String studentId) {
    students.removeWhere((s) => s.id == studentId);
  }

  Student? findStudentById(String id) {
    for (final student in students) {
      if (student.id == id) return student;
    }
    return null;
  }

  List<Student> getStudentsByCourse(String courseId) {
    return students
        .where((s) => s.enrolledCourses.contains(courseId))
        .toList();
  }

  List<Course> getAvailableCoursesForStudent(String studentId) {
    final student = findStudentById(studentId);
    if (student == null) return [];
    return courses
        .where((c) =>
            !student.enrolledCourses.contains(c.id) &&
            c.canStudentEnroll(student))
        .toList();
  }

  Map<String, dynamic> generateStatistics() {
    final count = students.length;
    final avgGpa = count == 0
        ? 0.0
        : students.fold<double>(0.0, (sum, s) => sum + s.gpa) / count;

    return {
      'universityName': name,
      'totalStudents': count,
      'totalProfessors': professors.length,
      'totalCourses': courses.length,
      'averageGPA': double.parse(avgGpa.toStringAsFixed(2)),
    };
  }
}