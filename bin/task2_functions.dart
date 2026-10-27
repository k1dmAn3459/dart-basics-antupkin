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
  final full = middleName != null
      ? '$lastName $firstName $middleName'
      : '$firstName $lastName';
  return uppercase ? full.toUpperCase() : full;
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

void testBasicFunctions() {
  print('--- 1. Basic & Recursive Functions ---');
  print('calculateSum(15, 27) = ${calculateSum(15, 27)}');
  print('calculateAverage([90, 95, 88, 92]) = ${calculateAverage([90, 95, 88, 92])}');
  print('factorial(6) = ${factorial(6)} | fibonacci(8) = ${fibonacci(8)}\n');
}

void testAdvancedFunctions() {
  print('--- 2. Optional & Named Parameters + Text Analyzer ---');
  print('Стандартне ім’я: ${formatName("Валерій", "Антипкін")}');
  print('Повне ім’я (CAPS): ${formatName("Валерій", "Антипкін", middleName: "Павлович", uppercase: true)}');

  const sampleText = 'Dart functions are first class objects and Dart is expressive';
  final wordStats = DataProcessor.countWords(sampleText);
  print('Текстовий аналізатор (кількість слів: $wordStats, символів: ${sampleText.length})\n');
}

void testFunctionalProgramming() {
  print('--- 3. Functional Programming & Closures ---');
  final numbers = [1, 2, 3, 4, 5, 6];
  final mapped = numbers.map((n) => n * 10).toList();
  final filtered = numbers.where((n) => n > 3).toList();
  final sum = numbers.fold<int>(0, (prev, el) => prev + el);

  int multiplierFactor = 4;
  int Function(int) multiplyClosure = (int x) => x * multiplierFactor;

  print('map (*10): $mapped | where (>3): $filtered | fold (sum): $sum');
  print('Closure (5 * $multiplierFactor): ${multiplyClosure(5)}\n');
}
