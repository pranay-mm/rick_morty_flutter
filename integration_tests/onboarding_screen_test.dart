import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class OnBoardingScreenTest {
  const OnBoardingScreenTest(this.widgetTester);
  final WidgetTester widgetTester;

  Future<void> findSkipAndClick() async {
    await widgetTester.pumpAndSettle();
    await widgetTester.ensureVisible(find.byKey(const Key('skip')));
    await widgetTester.pumpAndSettle();
    await widgetTester.tap(find.byKey(const Key('skip')));
  }
}
