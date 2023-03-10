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
    apiKey: 'AIzaSyB2lPitJZwHK6-EUGtqxn_878BcjHTOGmc',
    appId: '1:535156582683:web:ff0634c94382372f7e0bbe',
    messagingSenderId: '535156582683',
    projectId: 'video-4bc29',
    authDomain: 'video-4bc29.firebaseapp.com',
    storageBucket: 'video-4bc29.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiIb_Yk-3Nfi06G5AfrBR89SAlZuyprgA',
    appId: '1:535156582683:android:8c68c1ed05a9262f7e0bbe',
    messagingSenderId: '535156582683',
    projectId: 'video-4bc29',
    storageBucket: 'video-4bc29.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHzDOZdY08ectLF_h7gMGXOqbSmuR3M5Q',
    appId: '1:535156582683:ios:8c9e6297740e6cce7e0bbe',
    messagingSenderId: '535156582683',
    projectId: 'video-4bc29',
    storageBucket: 'video-4bc29.appspot.com',
    androidClientId: '535156582683-qqf072nbin2sgituetu8u3jv3afk2h4g.apps.googleusercontent.com',
    iosClientId: '535156582683-rbnpkc7l1mm3mvl45jr1avbljqrhd913.apps.googleusercontent.com',
    iosBundleId: 'com.example.viedorecoder',
  );
}
