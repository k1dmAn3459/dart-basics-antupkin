import 'package:dart_basics_antupkin/utils/calculator.dart';

void main() {
  print('=== Dart Variables & Types Demo ===\n');
  demonstrateNumbers();
  demonstrateStrings();
  demonstrateBooleans();
  demonstrateCollections();
  demonstrateNullSafety();
}

void demonstrateNumbers() {
  print('--- 1. Numbers & Calculator Demo ---');
  int intVal = 42;
  double doubleVal = 3.14159;
  num flexibleNum = intVal + doubleVal;

  String parsedToStr = intVal.toString();
  double parsedFromStr = double.parse('95.5');

  print('int: $intVal, double: $doubleVal, num: ${flexibleNum.toStringAsFixed(2)}');
  print('Type conversion: "$parsedToStr" (String), $parsedFromStr (double)');
  print('Calculator: 25 + 17 = ${Calculator.add(25, 17)}, 100 / 4 = ${Calculator.divide(100, 4)}\n');
}

void demonstrateStrings() {
  print('--- 2. Strings & Text Analyzer Demo ---');
  String firstName = 'Валерій';
  String lastName = 'Антипкін';
  String fullName = '$firstName $lastName';
  String multiLine = '''
Лінія 1: Програмування на Dart
Лінія 2: Кросплатформна розробка\t(Flutter)''';

  print('Інтерполяція: $fullName (верхній регістр: ${fullName.toUpperCase()})');
  print(multiLine);
  print('Довжина рядка: ${multiLine.length} символів, містить "Dart": ${multiLine.contains("Dart")}\n');
}

void demonstrateBooleans() {
  print('--- 3. Booleans Demo ---');
  int score = 92;
  bool hasAttendance = true;
  bool isHonorStudent = (score >= 90) && hasAttendance;
  String verdict = isHonorStudent ? 'Стипендія призначена' : 'Звичайний режим';

  print('Бал >= 90 та присутність: $isHonorStudent -> $verdict\n');
}

void demonstrateCollections() {
  print('--- 4. Basic Collections Demo ---');
  List<String> topics = ['Variables', 'Functions', 'OOP'];
  Set<int> uniqueIds = {101, 102, 101, 103};
  Map<String, int> credits = {'Dart': 5, 'Databases': 4};

  topics.add('Async');
  print('List: $topics | Set (унікальні): $uniqueIds | Map: $credits\n');
}

void demonstrateNullSafety() {
  print('--- 5. Null Safety Demo ---');
  String? optionalNote;
  String displayNote = optionalNote ?? 'Примітка відсутня';
  late String initializedLater;
  initializedLater = 'Ініціалізовано через late';

  print('Null-coalescing (??): $displayNote (довжина: ${optionalNote?.length})');
  print('Late variable: $initializedLater\n');
}
