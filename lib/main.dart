import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'features/onboarding/onboarding_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const OnBoardingScreen(),
    );
  }
}
