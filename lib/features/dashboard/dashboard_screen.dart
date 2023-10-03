import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_flutter/core/extensions.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/favourite/character_favourite_screen.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/list/character_list_screen.dart';
import 'package:rick_morty_flutter/features/settings/setting_screen.dart';
import 'package:rick_morty_flutter/generated/l10n.dart';

class DashboardPage extends ConsumerStatefulWidget {
  static const String id = 'dashboard_screen';

  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<DashboardPage> {
  int selectedIndex = 0;
  var activePageTitle = S.current.titleTabCharFavList;

  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //S.load(const Locale('es')); to load localization manually
    Widget bodyWidget = const CharacterListScreen();
    activePageTitle = S.current.titleTabCharList;
    if (selectedIndex == 1) {
      bodyWidget = const CharacterFavouriteListScreen();
      activePageTitle = S.current.titleTabCharFavList;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.surfaceVariant,
        title: Center(
            child: Text(
          activePageTitle,
        )),
        actions: [
          IconButton(
              key: const Key('settings_icon'),
              onPressed: () {
                Navigator.of(context).pushNamed(SettingsScreen.id);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: bodyWidget,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: const Icon(Icons.person),
            icon: const Icon(Icons.person_outlined),
            label: S.of(context).tabLableCharacters,
          ),
          NavigationDestination(
            key: const Key('favourite_tab'),
            selectedIcon: const Icon(Icons.star),
            icon: const Icon(Icons.star_outline),
            label: S.of(context).tabLableFavorite,
          ),
        ],
        onDestinationSelected: _selectPage,
      ),
    );
  }
}
