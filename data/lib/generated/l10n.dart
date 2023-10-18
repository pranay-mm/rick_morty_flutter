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

  /// `Request to API server was cancelled`
  String get errorDioCancel {
    return Intl.message(
      'Request to API server was cancelled',
      name: 'errorDioCancel',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout with API server`
  String get errorConnectionTimeout {
    return Intl.message(
      'Connection timeout with API server',
      name: 'errorConnectionTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout in connection with API server`
  String get errorReceiveTimeout {
    return Intl.message(
      'Receive timeout in connection with API server',
      name: 'errorReceiveTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout in connection with API server`
  String get errorSendTimeout {
    return Intl.message(
      'Send timeout in connection with API server',
      name: 'errorSendTimeout',
      desc: '',
      args: [],
    );
  }

  /// `No Internet`
  String get noInternet {
    return Intl.message(
      'No Internet',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Response data not found`
  String get responseDataNot {
    return Intl.message(
      'Response data not found',
      name: 'responseDataNot',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error occurred`
  String get unexpectedErrorOccurred {
    return Intl.message(
      'Unexpected error occurred',
      name: 'unexpectedErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get something_went_wrong {
    return Intl.message(
      'Something went wrong',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Bad request`
  String get bad_request {
    return Intl.message(
      'Bad request',
      name: 'bad_request',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized`
  String get unauthorized {
    return Intl.message(
      'Unauthorized',
      name: 'unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Forbidden`
  String get forbidden {
    return Intl.message(
      'Forbidden',
      name: 'forbidden',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Session Expired. Please LogIn again`
  String get sessionExpired {
    return Intl.message(
      'Session Expired. Please LogIn again',
      name: 'sessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error`
  String get internalServerError {
    return Intl.message(
      'Internal server error',
      name: 'internalServerError',
      desc: '',
      args: [],
    );
  }

  /// `Server unavailable`
  String get serverUnavailable {
    return Intl.message(
      'Server unavailable',
      name: 'serverUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Oops something went wrong`
  String get oopsSomethingWentWrong {
    return Intl.message(
      'Oops something went wrong',
      name: 'oopsSomethingWentWrong',
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
