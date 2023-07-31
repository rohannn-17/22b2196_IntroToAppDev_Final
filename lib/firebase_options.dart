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
    apiKey: 'AIzaSyCVkUAuKIz4hdfiJeCTUgNIOgP6FzyG9Ms',
    appId: '1:450680356549:web:7773e8ac7a726399fb3aac',
    messagingSenderId: '450680356549',
    projectId: 'flutter-fcm-67556',
    authDomain: 'flutter-fcm-67556.firebaseapp.com',
    storageBucket: 'flutter-fcm-67556.appspot.com',
    measurementId: 'G-PFJQ8MVL32',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8_vevq8NmYsdb7iwlyUOklFUP03BMER4',
    appId: '1:450680356549:android:72a0a9f5eafaf67afb3aac',
    messagingSenderId: '450680356549',
    projectId: 'flutter-fcm-67556',
    storageBucket: 'flutter-fcm-67556.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAXcUqVYYKLeTm0wBOLvB0YJKigYQOLkdw',
    appId: '1:450680356549:ios:319555ca04a108d4fb3aac',
    messagingSenderId: '450680356549',
    projectId: 'flutter-fcm-67556',
    storageBucket: 'flutter-fcm-67556.appspot.com',
    iosClientId: '450680356549-os3k5cb0de2uhporrg5p3rekc0et13vb.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFcm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAXcUqVYYKLeTm0wBOLvB0YJKigYQOLkdw',
    appId: '1:450680356549:ios:b05d3eb0f3b809d2fb3aac',
    messagingSenderId: '450680356549',
    projectId: 'flutter-fcm-67556',
    storageBucket: 'flutter-fcm-67556.appspot.com',
    iosClientId: '450680356549-drqdd0upa4t1pc32ttbgf1pn3mo661gt.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFcm.RunnerTests',
  );
}
