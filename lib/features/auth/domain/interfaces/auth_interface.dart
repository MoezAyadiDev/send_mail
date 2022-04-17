import 'package:injectable/injectable.dart';
import 'package:send_mail/features/auth/domain/entities/user.dart';

//@Singleton()
abstract class AuthInterface {
  Stream<User?> get user;
  User? get currentUser;

  Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError();
  }

  Future<bool> signInWithGoogle() async {
    throw UnimplementedError();
  }

  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError();
  }

  Future<bool> logOut() async {
    throw UnimplementedError();
  }

  Future<bool> mailVerificationPage() async {
    throw UnimplementedError();
  }
}
