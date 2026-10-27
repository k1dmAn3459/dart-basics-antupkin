import '../models/student.dart';

class DataProcessor {
  static List<int> filterEvenNumbers(List<int> numbers) =>
      numbers.where((n) => n.isEven).toList();

  static Map<String, int> wordFrequency(String text) {
    final words = text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\sа-яіїєґ]'), '')
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty);
    final freq = <String, int>{};
    for (final w in words) {
      freq[w] = (freq[w] ?? 0) + 1;
    }
    return freq;
  }

  static double calculateGroupAverage(List<Student> students) {
    if (students.isEmpty) return 0.0;
    return students.fold<double>(0.0, (sum, s) => sum + s.averageGrade) /
        students.length;
  }
}
