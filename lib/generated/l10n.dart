// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Select Character`
  String get titleTabCharList {
    return Intl.message(
      'Select Character',
      name: 'titleTabCharList',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get titleTabCharFavList {
    return Intl.message(
      'Favourites',
      name: 'titleTabCharFavList',
      desc: '',
      args: [],
    );
  }

  /// `Characters`
  String get tabLableCharacters {
    return Intl.message(
      'Characters',
      name: 'tabLableCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get tabLableFavorite {
    return Intl.message(
      'Favourite',
      name: 'tabLableFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Authentication`
  String get authentication {
    return Intl.message(
      'Authentication',
      name: 'authentication',
      desc: '',
      args: [],
    );
  }

  /// `Pickle Rick is the only one who can crack your password. So don’t worry, and enter your credentials.`
  String get authenticationInfo {
    return Intl.message(
      'Pickle Rick is the only one who can crack your password. So don’t worry, and enter your credentials.',
      name: 'authenticationInfo',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `It's the key to your portal gun!`
  String get emailHelperText {
    return Intl.message(
      'It\'s the key to your portal gun!',
      name: 'emailHelperText',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Your password must be at least 9 dimensions long!`
  String get passwordHelperText {
    return Intl.message(
      'Your password must be at least 9 dimensions long!',
      name: 'passwordHelperText',
      desc: '',
      args: [],
    );
  }

  /// `Note: If no account exists, one will be created for you`
  String get authNote {
    return Intl.message(
      'Note: If no account exists, one will be created for you',
      name: 'authNote',
      desc: '',
      args: [],
    );
  }

  /// `Get Schwifty`
  String get titles0 {
    return Intl.message(
      'Get Schwifty',
      name: 'titles0',
      desc: '',
      args: [],
    );
  }

  /// `Wubba Lubba Dub Dub`
  String get titles1 {
    return Intl.message(
      'Wubba Lubba Dub Dub',
      name: 'titles1',
      desc: '',
      args: [],
    );
  }

  /// `To Infinity and Beyond`
  String get titles2 {
    return Intl.message(
      'To Infinity and Beyond',
      name: 'titles2',
      desc: '',
      args: [],
    );
  }

  /// `Get ready to have some\nfun with Rick and Morty`
  String get subtitles0 {
    return Intl.message(
      'Get ready to have some\nfun with Rick and Morty',
      name: 'subtitles0',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the Rick\nand Morty universe`
  String get subtitles1 {
    return Intl.message(
      'Welcome to the Rick\nand Morty universe',
      name: 'subtitles1',
      desc: '',
      args: [],
    );
  }

  /// `Explore the multiverse\nwith Rick and Morty`
  String get subtitles2 {
    return Intl.message(
      'Explore the multiverse\nwith Rick and Morty',
      name: 'subtitles2',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Species`
  String get species {
    return Intl.message(
      'Species',
      name: 'species',
      desc: '',
      args: [],
    );
  }

  /// `Origin`
  String get origin {
    return Intl.message(
      'Origin',
      name: 'origin',
      desc: '',
      args: [],
    );
  }

  /// `Episodes`
  String get episodes {
    return Intl.message(
      'Episodes',
      name: 'episodes',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong! Please try again.`
  String get error_message {
    return Intl.message(
      'Something went wrong! Please try again.',
      name: 'error_message',
      desc: '',
      args: [],
    );
  }

  /// `Your favourite list is empty!`
  String get empty_favourite_screen {
    return Intl.message(
      'Your favourite list is empty!',
      name: 'empty_favourite_screen',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_theme {
    return Intl.message(
      'Dark Mode',
      name: 'dark_theme',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get light_theme {
    return Intl.message(
      'Light Mode',
      name: 'light_theme',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
