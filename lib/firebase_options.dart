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
    apiKey: 'AIzaSyC22wx5IKAcoALTwDX5PCWI2nFQCMQkRlw',
    appId: '1:59030283509:web:15a75e27f3a1906b3a91bc',
    messagingSenderId: '59030283509',
    projectId: 'enhanced-layout-388519',
    authDomain: 'enhanced-layout-388519.firebaseapp.com',
    storageBucket: 'enhanced-layout-388519.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDd4DB98_iLykgQGJhA-sZBKjhFbAyueZg',
    appId: '1:59030283509:android:efeea5065345a71c3a91bc',
    messagingSenderId: '59030283509',
    projectId: 'enhanced-layout-388519',
    storageBucket: 'enhanced-layout-388519.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCB04e_LNZjUWCjAKUJJSuqSG-J44WbMog',
    appId: '1:59030283509:ios:19bc94cfeb85ed213a91bc',
    messagingSenderId: '59030283509',
    projectId: 'enhanced-layout-388519',
    storageBucket: 'enhanced-layout-388519.appspot.com',
    iosBundleId: 'com.example.navigation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCB04e_LNZjUWCjAKUJJSuqSG-J44WbMog',
    appId: '1:59030283509:ios:cb6dd09056d92b713a91bc',
    messagingSenderId: '59030283509',
    projectId: 'enhanced-layout-388519',
    storageBucket: 'enhanced-layout-388519.appspot.com',
    iosBundleId: 'com.example.navigation.RunnerTests',
  );
}