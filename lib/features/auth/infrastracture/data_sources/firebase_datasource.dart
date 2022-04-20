import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:send_mail/commen/util/exception/auth_failures.dart';
import 'package:send_mail/commen/util/exception/failures.dart';
import 'package:send_mail/features/auth/domain/entities/utilisateur.dart';

@Singleton()
class FirebaseDataSource {
  late FirebaseAuth _firebaseAuth;
  FirebaseDataSource() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<Either<AuthentificationFailure, Utilisateur>>
      signInWithEmailAndPassword(String email, String password) async {
    User? currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      return Right(
        userToUtilisateur(currentUser),
      );
    } else {
      try {
        UserCredential _user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        return (_user.user != null)
            ? Right(userToUtilisateur(_user.user!))
            : const Left(
                AuthentificationFailure(
                  error: 'wrong-email-password',
                  message: 'You have entered an invalid username or password',
                ),
              );
      } on FirebaseAuthException catch (e) {
        return Left(AuthentificationFailure(error: e.code, message: e.message));
      }
    }
  }
}

Utilisateur userToUtilisateur(User _user) => Utilisateur(
      _user.uid,
      _user.displayName ?? '',
      _user.email ?? '',
    );
