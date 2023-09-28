import 'dart:async';
import 'dart:developer';

import 'package:data/service/shared_pref_service.dart';
import 'package:domain/repository/characters_repo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_morty_flutter/features/auth/login_screen.dart';
import 'package:rick_morty_flutter/features/dashboard/characters/list/character_list_screen.dart';
import 'package:rick_morty_flutter/features/dashboard/dashboard_screen.dart';
import 'package:rick_morty_flutter/features/settings/setting_screen.dart';
import 'package:rick_morty_flutter/injectable_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configAppInjection('debug');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final pref = GetIt.I.get<SharedPreferencesService>();
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Rick and Morty',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          primary: const Color(0xFF6750A4),
          onPrimary: const Color(0xFFFFFFFF),
          secondary: const Color(0xFF625B71),
          onSecondary: const Color(0xFFFFFFFF),
          secondaryContainer: const Color(0xFFE8DEF8),
          onSecondaryContainer: const Color(0xFF4A4458),
          onPrimaryContainer: const Color(0xFF21005D),
          primaryContainer: const Color(0xFFEADDFF),
          error: const Color(0xFFF2B8B5),
        ),
        useMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD0BCFF),
          primary: const Color(0xFFD0BCFF),
          onPrimary: const Color(0xFF4F378B),
          secondary: const Color(0xFFCCC2DC),
          onSecondary: const Color(0xFF332D41),
          secondaryContainer: const Color(0xFF4A4458),
          onSecondaryContainer: const Color(0xFFE8DEF8),
          primaryContainer: const Color(0xFFECE6F0),
          onPrimaryContainer: const Color(0xFF21005D),
          error: const Color(0xFFB3261E),
        ),
        useMaterial3: true,
      ),
      themeMode: pref.themeFlagKey ? ThemeMode.dark : ThemeMode.light,
      routes: {
        OnBoardingScreen.id: (context) => const OnBoardingScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        DashboardPage.id: (context) => const DashboardPage(),
        SettingsScreen.id: (context) => const SettingsScreen(),
        CharacterListScreen.id: (context) => const CharacterListScreen()
      },
      builder: (context, child) {
        return FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return child!;
            } else {
              return Container(
                color: Colors.white,
                child: const CircularProgressIndicator(),
              );
            }
          },
          future: GetIt.I.isReady<CharactersRepository>(),
        );
      },
      home: !pref.isOnBoardingShown
          ? const OnBoardingScreen()
          : (pref.isUserLoggedIn ? const DashboardPage() : const LoginScreen()),
    );
  }
}
