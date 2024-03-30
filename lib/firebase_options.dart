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
    apiKey: 'AIzaSyDtKbGbSk7jbahvarYbEaS9x_0v7a0qD6Y',
    appId: '1:89017853345:web:52ff61f0ef5734aabcd7e0',
    messagingSenderId: '89017853345',
    projectId: 'e-commerce-7b83a',
    authDomain: 'e-commerce-7b83a.firebaseapp.com',
    storageBucket: 'e-commerce-7b83a.appspot.com',
    measurementId: 'G-W1CLW44LCS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3YmmmWA8C8gPkFb-SA4IfyHjsbv8jiGo',
    appId: '1:89017853345:android:1a6677ec02184c5bbcd7e0',
    messagingSenderId: '89017853345',
    projectId: 'e-commerce-7b83a',
    storageBucket: 'e-commerce-7b83a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJXK-M67vMvFu7fHcGEEPtEosyt6EBnKk',
    appId: '1:89017853345:ios:6858bc7d0a23c43bbcd7e0',
    messagingSenderId: '89017853345',
    projectId: 'e-commerce-7b83a',
    storageBucket: 'e-commerce-7b83a.appspot.com',
    iosBundleId: 'com.example.demo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJXK-M67vMvFu7fHcGEEPtEosyt6EBnKk',
    appId: '1:89017853345:ios:99e45d89561481fbbcd7e0',
    messagingSenderId: '89017853345',
    projectId: 'e-commerce-7b83a',
    storageBucket: 'e-commerce-7b83a.appspot.com',
    iosBundleId: 'com.example.demo.RunnerTests',
  );
}
