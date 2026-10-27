import 'package:test/test.dart';
import 'package:dart_basics_antupkin/utils/calculator.dart';
import 'package:dart_basics_antupkin/utils/data_processor.dart';

void main() {
  test('Calculator and DataProcessor test', () {
    expect(Calculator.add(10, 5), equals(15));
    expect(Calculator.factorial(5), equals(120));
    expect(() => Calculator.divide(10, 0), throwsArgumentError);
    expect(DataProcessor.filterEvenNumbers([1, 2, 3, 4]), equals([2, 4]));
  });
}
