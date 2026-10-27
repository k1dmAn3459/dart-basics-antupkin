class Calculator {
  static double add(double a, double b) => a + b;
  static double subtract(double a, double b) => a - b;
  static double multiply(double a, double b) => a * b;
  static double divide(double a, double b) {
    if (b == 0) throw ArgumentError('Division by zero');
    return a / b;
  }

  static int factorial(int n) {
    if (n < 0) throw ArgumentError('Negative number');
    return n <= 1 ? 1 : n * factorial(n - 1);
  }
}
