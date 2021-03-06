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
    apiKey: 'AIzaSyCN_TDx_UzalXzxPg-qpFyJbpcWnUsWaI8',
    appId: '1:150588062530:web:85708e5a20562d637566db',
    messagingSenderId: '150588062530',
    projectId: 'bluebanx-2ba17',
    authDomain: 'bluebanx-2ba17.firebaseapp.com',
    storageBucket: 'bluebanx-2ba17.appspot.com',
    measurementId: 'G-5K8WNZR2ZJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcBuCih41ZmbM92fnekq1CCNIkWQpr-UE',
    appId: '1:150588062530:android:137be89d680cc9f67566db',
    messagingSenderId: '150588062530',
    projectId: 'bluebanx-2ba17',
    storageBucket: 'bluebanx-2ba17.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZX2zFMOMYo5oO8WD6DXj_1IYy2fSqVJ4',
    appId: '1:150588062530:ios:ca104dcad3e224877566db',
    messagingSenderId: '150588062530',
    projectId: 'bluebanx-2ba17',
    storageBucket: 'bluebanx-2ba17.appspot.com',
    iosClientId:
        '150588062530-f32bq5nrt5l51tlofqkp415pa37v8d1m.apps.googleusercontent.com',
    iosBundleId: 'com.example.bluebenx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZX2zFMOMYo5oO8WD6DXj_1IYy2fSqVJ4',
    appId: '1:150588062530:ios:ca104dcad3e224877566db',
    messagingSenderId: '150588062530',
    projectId: 'bluebanx-2ba17',
    storageBucket: 'bluebanx-2ba17.appspot.com',
    iosClientId:
        '150588062530-f32bq5nrt5l51tlofqkp415pa37v8d1m.apps.googleusercontent.com',
    iosBundleId: 'com.example.bluebenx',
  );
}
