PS C:\Users\квасдопил\smarthome\dart_basics_antupkin> dart run bin/task1_variables.dart
=== Dart Variables & Types Demo ===

--- 1. Numbers & Calculator Demo ---
int: 42, double: 3.14159, num: 45.14
Type conversion: "42" (String), 95.5 (double)
Калькулятор: 25 + 17 = 42.0, 100 / 4 = 25.0

--- 2. Strings Demo ---
Ім’я: Валерій Антипкін (верхній регістр: ВАЛЕРІЙ АНТИПКІН)
Рядок 1: Основи програмування на Dart
Рядок 2: Мобільна розробка      (Flutter SDK)
Довжина тексту: 78 символів, містить слово "Dart": true

--- 3. Booleans Demo ---
Бал (92 >= 90) І присутність (true) -> true (Підвищена стипендія)

--- 4. Basic Collections Demo ---
List: [Variables, Functions, OOP, Async]
Set (тільки унікальні): {101, 102, 103}
Map (предмет -> кредити): {Dart: 5, Databases: 4}

--- 5. Null Safety Demo ---
Оператор ??: Значення за замовчуванням (безпечний виклик довжини ?.: null)
Late змінна: Змінна late отримала значення пізніше

PS C:\Users\квасдопил\smarthome\dart_basics_antupkin> dart run bin/task2_functions.dart
=== Dart Functions Demo ===

--- 1. Basic & Recursive Functions ---
Сума calculateSum(15, 27) = 42
Середнє calculateAverage([90, 95, 88, 92]) = 91.25
Факторіал 5! = 120 | Число Фібоначчі (8) = 21

--- 2. Named Parameters & Text Analyzer ---
Звичайне форматування: Валерій Антипкін
Повне ім’я (CAPS): АНТИПКІН ВАЛЕРІЙ ПАВЛОВИЧ
Текстовий аналізатор рядка: "Dart дозволяє писати швидкий та надійний код для мобільних платформ"
Результат аналізу: слів = 10, символів = 67 (без пробілів: 58)

--- 3. Functional Programming (map, where, fold) & Closures ---
Початковий список: [1, 2, 3, 4, 5, 6]
map (квадрати): [1, 4, 9, 16, 25, 36] | where (парні): [2, 4, 6] | fold (сума): 21
Демонстрація Closure (7 * 10): 70

PS C:\Users\квасдопил\smarthome\dart_basics_antupkin> git add lib/utils/calculator.dart bin/task1_variables.dart bin/task2_functions.dart
warning: in the working copy of 'bin/task1_variables.dart', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'bin/task2_functions.dart', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'lib/utils/calculator.dart', LF will be replaced by CRLF the next time Git touches it
PS C:\Users\квасдопил\smarthome\dart_basics_antupkin> git commit -m "feat(task2): complete variables, types and functions specification"
[main ad755ce] feat(task2): complete variables, types and functions specification
 3 files changed, 77 insertions(+), 43 deletions(-)
PS C:\Users\квасдопил\smarthome\dart_basics_antupkin> 