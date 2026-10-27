class Calculator {
  static double add(double a, double b) => a + b;
  static double subtract(double a, double b) => a - b;
  static double multiply(double a, double b) => a * b;

  static double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Ділення на нуль неможливе');
    }
    return a / b;
  }

  static int factorial(int n) {
    if (n < 0) throw ArgumentError('n має бути >= 0');
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }

  static int fibonacci(int n) {
    if (n < 0) throw ArgumentError('n має бути >= 0');
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}