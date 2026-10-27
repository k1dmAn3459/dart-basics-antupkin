void main() {
  print('=== Завдання 1: Змінні та типи даних ===');
  int age = 20;
  double gpa = 92.5;
  String studentName = 'Валерій Антипкін';
  bool isEnrolled = true;
  var semester = 3;
  final now = DateTime.now();
  const uni = 'ІСТУ';
  String? nickname;
  late String status;
  status = gpa >= 90 ? 'Відмінник' : 'Студент';
  print(
    'Студент: $studentName ($age років), Університет: $uni, Семестр: $semester',
  );
  print(
    'Бал: $gpa, Навчається: $isEnrolled, Статус: $status, Нік: ${nickname ?? "Немає"} ($now)',
  );
}
