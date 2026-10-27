class Student {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final List<String> enrolledCourses;
  final Map<String, double> grades;
  final List<String> skills;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    List<String>? enrolledCourses,
    Map<String, double>? grades,
    List<String>? skills,
  })  : enrolledCourses = enrolledCourses ?? [],
        grades = grades ?? {},
        skills = skills ?? [];

  String get fullName => '$firstName$lastName';

  int get age {
    final now = DateTime.now();
    int years = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      years--;
    }
    return years;
  }

  double get gpa {
    if (grades.isEmpty) return 0.0;
    final sum = grades.values.reduce((a, b) => a + b);
    return sum / grades.length;
  }

  void enrollInCourse(String courseId) {
    if (!enrolledCourses.contains(courseId)) {
      enrolledCourses.add(courseId);
    }
  }

  void addGrade(String courseId, double grade) {
    if (grade < 0 || grade > 100) {
      throw ArgumentError('Оцінка має бути від 0 до 100');
    }
    enrollInCourse(courseId);
    grades[courseId] = grade;
  }

  List<String> getPassedCourses() {
    return grades.entries
        .where((entry) => entry.value >= 60.0)
        .map((entry) => entry.key)
        .toList();
  }

  @override
  String toString() {
    return 'Student(id: $id, name: $fullName, age:$age, GPA: ${gpa.toStringAsFixed(2)}, courses:$enrolledCourses)';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate.toIso8601String(),
      'enrolledCourses': enrolledCourses,
      'grades': grades,
      'skills': skills,
    };
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      enrolledCourses: List<String>.from(json['enrolledCourses'] ?? []),
      grades: (json['grades'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, (v as num).toDouble()),
          ) ??
          {},
      skills: List<String>.from(json['skills'] ?? []),
    );
  }
}
