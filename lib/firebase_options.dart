// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD8M_osLvKFkJu8gi1LF3ivei9ww-U9Prk',
    appId: '1:325491141704:web:468e273b3f91bbb4907c7d',
    messagingSenderId: '325491141704',
    projectId: 'flutter-rick-morty',
    authDomain: 'flutter-rick-morty.firebaseapp.com',
    storageBucket: 'flutter-rick-morty.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrvcf5irsF87wlxvHrrZ51jvZ1t8eYboM',
    appId: '1:325491141704:android:96f68081ddfb5776907c7d',
    messagingSenderId: '325491141704',
    projectId: 'flutter-rick-morty',
    storageBucket: 'flutter-rick-morty.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCChMRfCF6VwJFgpzC0kRvCCIIugjrSDCU',
    appId: '1:325491141704:ios:03b2cf9d9bf5a71d907c7d',
    messagingSenderId: '325491141704',
    projectId: 'flutter-rick-morty',
    storageBucket: 'flutter-rick-morty.appspot.com',
    iosBundleId: 'com.example.rickMortyFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCChMRfCF6VwJFgpzC0kRvCCIIugjrSDCU',
    appId: '1:325491141704:ios:7347e585783ff426907c7d',
    messagingSenderId: '325491141704',
    projectId: 'flutter-rick-morty',
    storageBucket: 'flutter-rick-morty.appspot.com',
    iosBundleId: 'com.example.rickMortyFlutter.RunnerTests',
  );
}