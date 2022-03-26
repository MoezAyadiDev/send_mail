import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOption {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDTMONLIB5ZQKS8CSGEf_4ePOG2s_U1Rs',
    appId: '1:1089032125998:android:96ba4916eda7dc798da9bf',
    messagingSenderId: '1089032125998',
    projectId: 'flutter-send-mail',
    storageBucket: 'flutter-send-mail.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDTMONLIB5ZQKS8CSGEf_4ePOG2s_U1Rs',
    appId: '1:1089032125998:android:96ba4916eda7dc798da9bf',
    messagingSenderId: '1089032125998',
    projectId: 'flutter-send-mail',
    storageBucket: 'flutter-send-mail.appspot.com',
    androidClientId:
        '1089032125998-fq3fsfve1gr6uajnlts088lelkanbgkv.apps.googleusercontent.com',
    iosBundleId: 'com.mait.send_mail',
  );
}
