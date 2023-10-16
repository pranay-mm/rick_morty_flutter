import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_flutter/main.dart' as app;
import 'package:integration_test/integration_test.dart';

import 'dashboard_screens_tests.dart';
import 'login_screen_tests.dart';
import 'onboarding_screen_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized().framePolicy =
      LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  testWidgets('rick morty ui test', (widgetTester) async {
    await app.main();
    final onboardingTest = OnBoardingScreenTest(widgetTester);
    final loginTests = LoginScreenTest(widgetTester);
    final charsTest = CharacterListTests(widgetTester);

    await onboardingTest.findSkipAndClick();
    await widgetTester.pump(const Duration(seconds: 2));
    await loginTests.findWidgetsWithText();
    await loginTests.checkLoginSuccessFailedCase(
        false); // pass true for case failed with wrong email
    sleep(const Duration(seconds: 5));
    await charsTest.scrollDownThePage();
    await charsTest.scrollUpThePage();
    await charsTest.clickOnItemWithID(id: '1');
    await charsTest.clickOnItemFab(id: '1');
    await charsTest.clickOnLikeButton();
    await charsTest.navigateBack();
    await charsTest.clickOnFavTab();
    await charsTest.clickOnSettings();
    await charsTest.clickOnThemeChange();
    await charsTest.clickOnLogout();
    await charsTest.clickOnLogoutConfirm();
  });
}
