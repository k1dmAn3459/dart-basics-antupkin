import 'package:dart_basics_antupkin/utils/data_processor.dart';

void main() {
  print('=== Dart Functions Demo ===\n');
  testBasicFunctions();
  testAdvancedFunctions();
  testFunctionalProgramming();
}

int calculateSum(int a, int b) => a + b;

double calculateAverage(List<double> numbers) {
  if (numbers.isEmpty) return 0.0;
  return numbers.reduce((a, b) => a + b) / numbers.length;
}

String formatName(
  String firstName,
  String lastName, {
  String? middleName,
  bool uppercase = false,
}) {
  final result = middleName != null
      ? '$lastName $firstName $middleName'
      : '$firstName $lastName';
  return uppercase ? result.toUpperCase() : result;
}

int fibonacci(int n) {
  if (n <= 0) return 0;
  if (n == 1) return 1;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

Map<String, dynamic> analyzeText(String text) {
  final words = text
      .trim()
      .split(RegExp(r'\s+'))
      .where((w) => w.isNotEmpty)
      .toList();
  final charCountNoSpaces = text.replaceAll(' ', '').length;
  return {
    'totalChars': text.length,
    'charsWithoutSpaces': charCountNoSpaces,
    'wordCount': words.length,
  };
}

void testBasicFunctions() {
  print('--- 1. Basic & Recursive Functions ---');
  print('calculateSum(15, 27) = ${calculateSum(15, 27)}');
  print('calculateAverage([90, 95, 88, 92]) = ${calculateAverage([90, 95, 88, 92])}');
  print('factorial(5) = ${factorial(5)} | fibonacci(8) = ${fibonacci(8)}\n');
}

void testAdvancedFunctions() {
  print('--- 2. Named Parameters & Text Analyzer ---');
  print('Звичайне форматування: ${formatName("Валерій", "Антипкін")}');
  print('Повне ім’я (CAPS): ${formatName("Валерій", "Антипкін", middleName: "Павлович", uppercase: true)}');

  const sample = 'Dart дозволяє писати швидкий та надійний код для мобільних платформ';
  final stats = analyzeText(sample);
  print('Текстовий аналізатор рядка: "$sample"');
  print('Результат аналізу: слів = ${stats["wordCount"]}, символів = ${stats["totalChars"]}\n');
}

// Використовуємо декларацію функції замість присвоєння змінній (на вимогу лінтера)
int multiplyByFactor(int value, int factor) => value * factor;

void testFunctionalProgramming() {
  print('--- 3. Functional Programming & Closures ---');
  final numbers = [1, 2, 3, 4, 5, 6];
  final squared = numbers.map((n) => n * n).toList();
  final evenOnly = numbers.where((n) => n.isEven).toList();
  final totalSum = numbers.fold<int>(0, (prev, element) => prev + element);

  int factor = 10;

  print('Початковий список: $numbers');
  print('map: $squared | where: $evenOnly | fold: $totalSum');
  print('Виклик функції (7 * $factor): ${multiplyByFactor(7, factor)}\n');
}