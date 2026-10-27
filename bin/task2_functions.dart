void main() {
  print('=== Dart Functions Demo ===\n');
  testBasicFunctions();
  testAdvancedFunctions();
  testFunctionalProgramming();
}

// 1. Звичайні функції з параметрами
int calculateSum(int a, int b) {
  return a + b;
}

double calculateAverage(List<double> numbers) {
  if (numbers.isEmpty) return 0.0;
  return numbers.reduce((a, b) => a + b) / numbers.length;
}

// 2. Функція з іменованими та необов'язковими параметрами
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

// 3. Рекурсивні функції
int fibonacci(int n) {
  if (n <= 0) return 0;
  if (n == 1) return 1;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

// Допоміжна функція текстового аналізатора (Deliverable 2.3)
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
  print('Сума calculateSum(15, 27) = ${calculateSum(15, 27)}');
  print('Середнє calculateAverage([90, 95, 88, 92]) = ${calculateAverage([90, 95, 88, 92])}');
  print('Факторіал 5! = ${factorial(5)} | Число Фібоначчі (8) = ${fibonacci(8)}\n');
}

void testAdvancedFunctions() {
  print('--- 2. Named Parameters & Text Analyzer ---');
  print('Звичайне форматування: ${formatName("Валерій", "Антипкін")}');
  print('Повне ім’я (CAPS): ${formatName("Валерій", "Антипкін", middleName: "Павлович", uppercase: true)}');

  const sample = 'Dart дозволяє писати швидкий та надійний код для мобільних платформ';
  final stats = analyzeText(sample);
  print('Текстовий аналізатор рядка: "$sample"');
  print('Результат аналізу: слів = ${stats["wordCount"]}, символів = ${stats["totalChars"]} (без пробілів: ${stats["charsWithoutSpaces"]})\n');
}

void testFunctionalProgramming() {
  print('--- 3. Functional Programming (map, where, fold) & Closures ---');
  final numbers = [1, 2, 3, 4, 5, 6];
  final squared = numbers.map((n) => n * n).toList();
  final evenOnly = numbers.where((n) => n.isEven).toList();
  final totalSum = numbers.fold<int>(0, (prev, element) => prev + element);

  // Замикання (Closure): функція запам'ятовує змінну factor зі свого оточення
  int factor = 10;
  int Function(int) multiplyByFactor = (int value) => value * factor;

  print('Початковий список: $numbers');
  print('map (квадрати): $squared | where (парні): $evenOnly | fold (сума): $totalSum');
  print('Демонстрація Closure (7 * $factor): ${multiplyByFactor(7)}\n');
}