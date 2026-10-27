import '../models/student.dart';
import '../models/university.dart';

class DataProcessor {
  static List<int> filterEvenNumbers(List<int> numbers) {
    return numbers.where((n) => n.isEven).toList();
  }

  static Map<String, int> countWords(String text) {
    final cleaned = text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\sа-яіїєґ]'), '')
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty);

    final counts = <String, int>{};
    for (final word in cleaned) {
      counts[word] = (counts[word] ?? 0) + 1;
    }
    return counts;
  }

  static List<Map<String, dynamic>> sortStudentsByGPA(List<Student> students) {
    final sorted = List<Student>.from(students)
      ..sort((a, b) => b.gpa.compareTo(a.gpa));
    return sorted
        .map((s) => {
              'id': s.id,
              'fullName': s.fullName,
              'gpa': double.parse(s.gpa.toStringAsFixed(2)),
            })
        .toList();
  }

  static Set<String> getUniqueSkills(List<Student> students) {
    return students.expand((s) => s.skills).toSet();
  }

  static Set<String> findCommonCourses(List<Student> students) {
    if (students.isEmpty) return {};
    return students
        .map((s) => s.enrolledCourses.toSet())
        .reduce((a, b) => a.intersection(b));
  }

  static Map<String, List<Student>> groupStudentsByYear(
      List<Student> students) {
    final grouped = <String, List<Student>>{};
    for (final student in students) {
      final yearKey = student.birthDate.year.toString();
      grouped.putIfAbsent(yearKey, () => []).add(student);
    }
    return grouped;
  }

  static Map<String, double> calculateAverageGradesByCourse(
      List<Student> students) {
    final totals = <String, List<double>>{};
    for (final student in students) {
      student.grades.forEach((courseId, grade) {
        totals.putIfAbsent(courseId, () => []).add(grade);
      });
    }
    return totals.map((courseId, grades) {
      final avg = grades.reduce((a, b) => a + b) / grades.length;
      return MapEntry(courseId, double.parse(avg.toStringAsFixed(2)));
    });
  }

  static List<Map<String, dynamic>> generateReport(University university) {
    final courseAverages = calculateAverageGradesByCourse(university.students);
    return university.courses.map((course) {
      final enrolled = university.getStudentsByCourse(course.id);
      return {
        'courseId': course.id,
        'courseName': course.name,
        'instructor': course.instructor,
        'enrolledCount': enrolled.length,
        'averageGrade': courseAverages[course.id] ?? 0.0,
      };
    }).toList();
  }
}
