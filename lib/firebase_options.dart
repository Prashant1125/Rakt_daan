// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD3uFbBkk1KqkiD1VMusxbZmvVloxMGdCU',
    appId: '1:40532256969:web:f6e509e0b47f5d8091c518',
    messagingSenderId: '40532256969',
    projectId: 'rakt-daan-1e61a',
    authDomain: 'rakt-daan-1e61a.firebaseapp.com',
    databaseURL: 'https://rakt-daan-1e61a-default-rtdb.firebaseio.com',
    storageBucket: 'rakt-daan-1e61a.firebasestorage.app',
    measurementId: 'G-D4S7P0K3K1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmUmJT0LuehPGA1jZxb9hefYxbJ2Hz124',
    appId: '1:40532256969:android:5693133b047b95a691c518',
    messagingSenderId: '40532256969',
    projectId: 'rakt-daan-1e61a',
    databaseURL: 'https://rakt-daan-1e61a-default-rtdb.firebaseio.com',
    storageBucket: 'rakt-daan-1e61a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpycC2uoFqHNnJzQG6Tq6-d4xVr2oEPkA',
    appId: '1:40532256969:ios:721766a4a047a65791c518',
    messagingSenderId: '40532256969',
    projectId: 'rakt-daan-1e61a',
    databaseURL: 'https://rakt-daan-1e61a-default-rtdb.firebaseio.com',
    storageBucket: 'rakt-daan-1e61a.firebasestorage.app',
    androidClientId: '40532256969-pekqmh94khjlf9jr8t5l7ot69828d180.apps.googleusercontent.com',
    iosClientId: '40532256969-sor2cuj8nlc2d0npris4mvtrhlv14ar0.apps.googleusercontent.com',
    iosBundleId: 'com.example.raktDaan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpycC2uoFqHNnJzQG6Tq6-d4xVr2oEPkA',
    appId: '1:40532256969:ios:721766a4a047a65791c518',
    messagingSenderId: '40532256969',
    projectId: 'rakt-daan-1e61a',
    databaseURL: 'https://rakt-daan-1e61a-default-rtdb.firebaseio.com',
    storageBucket: 'rakt-daan-1e61a.firebasestorage.app',
    androidClientId: '40532256969-pekqmh94khjlf9jr8t5l7ot69828d180.apps.googleusercontent.com',
    iosClientId: '40532256969-sor2cuj8nlc2d0npris4mvtrhlv14ar0.apps.googleusercontent.com',
    iosBundleId: 'com.example.raktDaan',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD3uFbBkk1KqkiD1VMusxbZmvVloxMGdCU',
    appId: '1:40532256969:web:5bae2a944f0de38591c518',
    messagingSenderId: '40532256969',
    projectId: 'rakt-daan-1e61a',
    authDomain: 'rakt-daan-1e61a.firebaseapp.com',
    databaseURL: 'https://rakt-daan-1e61a-default-rtdb.firebaseio.com',
    storageBucket: 'rakt-daan-1e61a.firebasestorage.app',
    measurementId: 'G-V7J20PS7F9',
  );
}
