import 'package:dart_basics_antupkin/utils/calculator.dart';

void main() {
  print('=== Dart Variables & Types Demo ===\n');
  demonstrateNumbers();
  demonstrateStrings();
  demonstrateBooleans();
  demonstrateCollections();
  demonstrateNullSafety();
}

// 1. Числа (int, double, num), мат. операції, конвертація типів та калькулятор
void demonstrateNumbers() {
  print('--- 1. Numbers & Calculator Demo ---');
  int intVal = 42;
  double doubleVal = 3.14159;
  num flexibleNum = intVal + doubleVal;

  // Конвертація типів (Type conversion)
  String parsedToStr = intVal.toString();
  double parsedFromStr = double.parse('95.5');

  print('int: $intVal, double: $doubleVal, num: ${flexibleNum.toStringAsFixed(2)}');
  print('Type conversion: "$parsedToStr" (String), $parsedFromStr (double)');
  print('Калькулятор: 25 + 17 = ${Calculator.add(25, 17)}, 100 / 4 = ${Calculator.divide(100, 4)}\n');
}

// 2. Рядки (інтерполяція, багаторядковий текст, escape-послідовності, методи)
void demonstrateStrings() {
  print('--- 2. Strings Demo ---');
  String firstName = 'Валерій';
  String lastName = 'Антипкін';
  String fullName = '$firstName $lastName'; // Інтерполяція

  // Multi-line string та escape-послідовність \t (табуляція)
  String multiLine = '''
Рядок 1: Основи програмування на Dart
Рядок 2: Мобільна розробка\t(Flutter SDK)''';

  print('Ім’я: $fullName (верхній регістр: ${fullName.toUpperCase()})');
  print(multiLine);
  print('Довжина тексту: ${multiLine.length} символів, містить слово "Dart": ${multiLine.contains("Dart")}\n');
}

// 3. Логічний тип (bool, порівняння, тернарний оператор)
void demonstrateBooleans() {
  print('--- 3. Booleans Demo ---');
  int score = 92;
  bool hasAttendance = true;
  bool isHonorStudent = (score >= 90) && hasAttendance;
  String verdict = isHonorStudent ? 'Підвищена стипендія' : 'Звичайний режим';

  print('Бал ($score >= 90) І присутність ($hasAttendance) -> $isHonorStudent ($verdict)\n');
}

// 4. Базові колекції (List, Set, Map)
void demonstrateCollections() {
  print('--- 4. Basic Collections Demo ---');
  List<String> topics = ['Variables', 'Functions', 'OOP'];
  Set<int> uniqueIds = {101, 102, 101, 103}; // Дублікат 101 автоматично видалиться
  Map<String, int> credits = {'Dart': 5, 'Databases': 4};

  topics.add('Async');
  print('List: $topics');
  print('Set (тільки унікальні): $uniqueIds');
  print('Map (предмет -> кредити): $credits\n');
}

// 5. Null Safety (?, ??, ?., late)
void demonstrateNullSafety() {
  print('--- 5. Null Safety Demo ---');
  String? nullableText; // Може бути null
  String safeText = nullableText ?? 'Значення за замовчуванням';

  late String lateInitialized;
  lateInitialized = 'Змінна late отримала значення пізніше';

  print('Оператор ??: $safeText (безпечний виклик довжини ?.: ${nullableText?.length})');
  print('Late змінна: $lateInitialized\n');
}