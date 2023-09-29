import 'package:data/service/shared_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_morty_flutter/core/extensions.dart';
import 'package:rick_morty_flutter/core/provider/app_theme_provider.dart';
import 'package:rick_morty_flutter/features/auth/login_screen.dart';
import 'package:rick_morty_flutter/features/auth/provider/authentication_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  static const String id = 'setting_screen';
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final pref = GetIt.I.get<SharedPreferencesService>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              tileColor: context.colorScheme.primaryContainer,
              leading: pref.themeFlagKey
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined),
              trailing: Switch(
                key: const Key('theme_toggle'),
                  value: pref.themeFlagKey,
                  onChanged: (value) {
                    setState(() {
                      ref.read(appThemeProvider.notifier).state = value;
                      pref.themeFlagKey = value;
                    });
                  }),
              title: Text(
                'Theme',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                pref.themeFlagKey ? 'Dark Mode' : 'Light Mode',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
            ),
            const SizedBox(
              height: 12,
            ),
            ListTile(
              key: const Key('signout_option'),
              onTap: () {
                _dialogBuilder(context, ref);
              },
              tileColor: context.colorScheme.primaryContainer,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              leading: const Icon(Icons.person_rounded),
              trailing: const Icon(Icons.exit_to_app),
              title: Text(
                'Account',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Sign Out',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, WidgetRef ref) {
    final pref = GetIt.I.get<SharedPreferencesService>();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(Icons.phone_android),
          title: const Text('Confirm Sign Out'),
          content: const Text(
            'Are you sure you want to sign out of the app? Tap on ‘Sign Out’ to confirm.',
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel',
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: context.colorScheme.onPrimary)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              key: const Key('signout_button'),
              child: Text('Sign Out',
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: context.colorScheme.error)),
              onPressed: () {
                pref.isUserLoggedIn = false;
                pref.isOnBoardingShown = false;
                ref.read(authNotifierProvider.notifier).logOut();
                Navigator.pop(context);
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
