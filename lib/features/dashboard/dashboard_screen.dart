import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_flutter/core/extensions.dart';
import 'package:rick_morty_flutter/features/characters/favourite/character_favourite_screen.dart';
import 'package:rick_morty_flutter/features/characters/list/character_list_screen.dart';
import 'package:rick_morty_flutter/features/settings/setting_screen.dart';

class DashboardPage extends ConsumerStatefulWidget {
  static const String id = 'dashboard_screen';

  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<DashboardPage> {
  int selectedIndex = 0;
  var activePageTitle = 'Category';

  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget = const CharacterListScreen();
    activePageTitle = 'Select Character';
    if (selectedIndex == 1) {
      bodyWidget = const CharacterFavouriteListScreen();
      activePageTitle = 'Favourites';
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
              onPressed: () {
                Navigator.of(context).pushNamed(SettingsScreen.id);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: bodyWidget,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outlined),
            label: 'Characters',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.star),
            icon: Icon(Icons.star_outline),
            label: 'Favourite',
          ),
        ],
        onDestinationSelected: _selectPage,
      ),
    );
  }
}
