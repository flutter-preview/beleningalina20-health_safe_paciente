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
    apiKey: 'AIzaSyDd3JeEjiTM4PJRf0Fv0pCufVjXyp63gfg',
    appId: '1:193138336857:web:f4b6f4e3100e1eae443d48',
    messagingSenderId: '193138336857',
    projectId: 'health-safe-app',
    authDomain: 'health-safe-app.firebaseapp.com',
    storageBucket: 'health-safe-app.appspot.com',
    measurementId: 'G-LRNQDNQ8CC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyGmzvbY2ACzLG7UKNsVScD92XjVp6-C0',
    appId: '1:193138336857:android:8ff2b806244730f9443d48',
    messagingSenderId: '193138336857',
    projectId: 'health-safe-app',
    storageBucket: 'health-safe-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhy1Hzo4vrbEC-y4Wd3P0PLTojxyatcAI',
    appId: '1:193138336857:ios:4496f7bea030858c443d48',
    messagingSenderId: '193138336857',
    projectId: 'health-safe-app',
    storageBucket: 'health-safe-app.appspot.com',
    iosClientId: '193138336857-en49nejkqb6g7qed89hh16nto859icdv.apps.googleusercontent.com',
    iosBundleId: 'com.example.healthSafePaciente',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhy1Hzo4vrbEC-y4Wd3P0PLTojxyatcAI',
    appId: '1:193138336857:ios:4496f7bea030858c443d48',
    messagingSenderId: '193138336857',
    projectId: 'health-safe-app',
    storageBucket: 'health-safe-app.appspot.com',
    iosClientId: '193138336857-en49nejkqb6g7qed89hh16nto859icdv.apps.googleusercontent.com',
    iosBundleId: 'com.example.healthSafePaciente',
  );
}
