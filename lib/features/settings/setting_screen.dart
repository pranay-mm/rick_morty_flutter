import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_flutter/core/extensions.dart';
import 'package:rick_morty_flutter/features/auth/login_screen.dart';
import 'package:rick_morty_flutter/features/auth/provider/authentication_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  static const String id = 'setting_screen';
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool isDarkMode = false; // TODO: get it from preferance

  @override
  Widget build(BuildContext context) {
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
              leading: isDarkMode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined),
              trailing: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = !isDarkMode;
                      //TODO: implement storing flag in preferance and update app ui
                    });
                  }),
              title: Text(
                'Theme',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Dark Mode',
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
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Sign Out'),
          content: const Text(
            'Are you sure you want to sign out of the app? Tap on ‘Sign Out’ to confirm.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: context.textTheme.labelLarge
                    ?.copyWith(color: context.colorScheme.error),
              ),
              child: const Text('Sign Out'),
              onPressed: () {
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
