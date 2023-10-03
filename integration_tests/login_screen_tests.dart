import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_flutter/generated/l10n.dart';

class LoginScreenTest {
  const LoginScreenTest(this.widgetTester);
  final WidgetTester widgetTester;

  Future<void> findWidgetsWithText() async {
    await widgetTester.pumpAndSettle();
    expect(find.text(S.current.authentication), findsNWidgets(2));
  }

  Future<void> checkLoginSuccessFailedCase(bool isForFailed) async {
    await widgetTester.enterText(
        find.byKey(const Key('emailField')),isForFailed ? 'wrongemail_here' : 'pranayp@yopmail.com');
    await widgetTester.enterText(
        find.byKey(const Key('passwordField')), '123123123');
    await widgetTester.pump(const Duration(seconds: 2));
    await widgetTester.tap(find.byKey(const Key('authButton')));
    await widgetTester.pump(const Duration(seconds: 2));
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(seconds: 2));
  }
}
