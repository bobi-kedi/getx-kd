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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFGDmb31WDgWLuX949_uJpVNoONyv8uCU',
    appId: '1:805688378308:android:fbf1b62562db9647cf9a91',
    messagingSenderId: '805688378308',
    projectId: 'kedi-lite',
    storageBucket: 'kedi-lite.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCtZ7uVHfOko2znlCTV3NpF17lCmL3-xY',
    appId: '1:805688378308:ios:3955f18a7c88ddbdcf9a91',
    messagingSenderId: '805688378308',
    projectId: 'kedi-lite',
    storageBucket: 'kedi-lite.appspot.com',
    androidClientId: '805688378308-54qm5tv1k9k8egvr390vm10ts17mnht6.apps.googleusercontent.com',
    iosClientId: '805688378308-4dcpaspk82sn2gjvutfi28vsdg6ks280.apps.googleusercontent.com',
    iosBundleId: 'id.kelasdigital.lite',
  );
}