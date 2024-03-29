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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB-3qKrYDrTQw61w5kxWTF6A31-aURKToo',
    appId: '1:1055354610024:web:78e6daf1a8c9217f8b76dd',
    messagingSenderId: '1055354610024',
    projectId: 'multi-modal-alarm-app',
    authDomain: 'multi-modal-alarm-app.firebaseapp.com',
    storageBucket: 'multi-modal-alarm-app.appspot.com',
    measurementId: 'G-D2NMPD8BCG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXDD-5YFv6U90IWMMWfwliQeqvIoYGcWQ',
    appId: '1:1055354610024:android:91eb5923542e56f38b76dd',
    messagingSenderId: '1055354610024',
    projectId: 'multi-modal-alarm-app',
    storageBucket: 'multi-modal-alarm-app.appspot.com',
  );
}
