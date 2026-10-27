import 'dart:async';

Future<String> fetchUser() async {
  await Future.delayed(const Duration(milliseconds: 200));
  return 'Валерій Антипкін';
}

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(const Duration(milliseconds: 100));
    yield i * 25;
  }
}

Future<void> main() async {
  print('=== Завдання 5: Асинхронність ===');
  final user = await fetchUser();
  print('Завантажено профіль: $user');
  await for (final p in countStream(4)) {
    print('Прогрес: $p%');
  }
}
