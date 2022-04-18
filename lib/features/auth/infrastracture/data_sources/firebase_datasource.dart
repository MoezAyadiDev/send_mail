import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class FirebaseDataSource {
  late FirebaseAuth _firebaseAuth;
  FirebaseDataSource() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    debugPrint('FirebaseDataSource signInWithEmailAndPassword');
    User? currentUser = _firebaseAuth.currentUser;
    debugPrint(currentUser.toString());
    if (currentUser != null) {
      return true;
    } else {
      try {
        UserCredential _user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        debugPrint(_user.toString());
        return (_user.user != null) ? true : false;
      } catch (e) {
        debugPrint('erreur ' + e.toString());
        return false;
      }
    }
  }
}
