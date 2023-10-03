
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CharacterListTests {
  const CharacterListTests(this.widgetTester);
  final WidgetTester widgetTester;

  Future<void> scrollDownThePage() async {
    await widgetTester.pumpAndSettle();
    await widgetTester
        .ensureVisible(find.byKey(const Key('characterListView')));
    final listFinder = find.byKey(const Key('characterListView'));
    await widgetTester.fling(listFinder, const Offset(0, -500), 600);
    await widgetTester.pumpAndSettle();
  }

  Future<void> scrollUpThePage() async {
    final listFinder = find.byKey(const Key('characterListView'));
    await widgetTester.fling(listFinder, const Offset(0, 500), 5000);
    await widgetTester.pumpAndSettle();
  }

  Future<void> clickOnItemWithID({required String id}) async {
    final itemFinder = find.byKey(Key('characterItem:$id'));
    await widgetTester.ensureVisible(itemFinder);
    await widgetTester.tap(itemFinder);
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> clickOnItemFab({required String id}) async {
    final itemFinder = find.descendant(
        of: find.byKey(Key('characterItem:$id')),
        matching: find.byType(FloatingActionButton));
    await widgetTester.ensureVisible(itemFinder);
    await widgetTester.tap(itemFinder);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(seconds: 2));
  }

  Future<void> clickOnLikeButton() async {
    final itemFinder = find.byKey(const Key('like'));
    await widgetTester.ensureVisible(itemFinder);
    await widgetTester.tap(itemFinder);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(seconds: 2));
  }

  Future<void> navigateBack() async {
    await widgetTester.pageBack();
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(seconds: 1));
  }

  Future<void> clickOnFavTab() async {
    final itemFinder = find.byKey(const Key('favourite_tab'));
    await widgetTester.ensureVisible(itemFinder);
    await widgetTester.tap(itemFinder);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(seconds: 2));
  }
  Future<void> clickOnSettings() async {
    final itemFinder = find.byKey(const Key('settings_icon'));
    await widgetTester.ensureVisible(itemFinder);
    await widgetTester.tap(itemFinder);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(seconds: 2));
  }
  Future<void> clickOnThemeChange() async {
    final itemFinder = find.byKey(const Key('theme_toggle'));
    await widgetTester.ensureVisible(itemFinder);
    await widgetTester.tap(itemFinder);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(seconds: 2));
  }
  Future<void> clickOnLogout() async {
    final itemFinder = find.byKey(const Key('signout_option'));
    await widgetTester.ensureVisible(itemFinder);
    await widgetTester.tap(itemFinder);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(seconds: 2));
  }
   Future<void> clickOnLogoutConfirm() async {
    final itemFinder = find.byKey(const Key('signout_button'));
    await widgetTester.ensureVisible(itemFinder);
    await widgetTester.tap(itemFinder);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(seconds: 2));
  }
}
