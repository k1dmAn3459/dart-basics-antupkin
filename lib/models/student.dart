class Student {
  final String id;
  final String firstName;
  final String lastName;
  int age;
  final Map<String, int> grades;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    Map<String, int>? grades,
  }) : grades = grades ?? {};

  String get fullName => '$firstName $lastName';

  double get averageGrade {
    if (grades.isEmpty) return 0.0;
    return grades.values.reduce((a, b) => a + b) / grades.length;
  }

  void addGrade(String subject, int grade) {
    if (grade < 0 || grade > 100) throw ArgumentError('Invalid grade');
    grades[subject] = grade;
  }

  @override
  String toString() =>
      'Student($id: $fullName, age: $age, avg: ${averageGrade.toStringAsFixed(1)})';
}
