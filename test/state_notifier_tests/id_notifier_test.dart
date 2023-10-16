// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:rick_morty_flutter/features/dashboard/characters/details/character_details_provider.dart';
import 'package:riverpod_test/riverpod_test.dart';

void main() {
  testStateNotifier<IdNotifier, int>('required greater then 1',
      provider: idProider,
      act: (notifier) => notifier.updateState(1),
      seed: 0,
      wait: const Duration(seconds: 1),
      expect: () => <int>[1]);
}
