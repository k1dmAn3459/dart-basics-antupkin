import 'package:dart_basics_antupkin/utils/calculator.dart';

String formatCard({required String name, String group = 'ІПЗ'}) =>
    '$name ($group)';
Function(int) multiplier(int factor) =>
    (int val) => val * factor;

void main() {
  print('=== Завдання 2: Функції ===');
  print(formatCard(name: 'Валерій Антипкін'));
  final triple = multiplier(3);
  print('Замикання 7*3 = ${triple(7)}');
  print(
    'Калькулятор 15+25 = ${Calculator.add(15, 25)}, 5! = ${Calculator.factorial(5)}',
  );
}
