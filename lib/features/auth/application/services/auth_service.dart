import 'package:injectable/injectable.dart';
import 'package:send_mail/features/auth/domain/interfaces/auth_interface.dart';


@Singleton()
class AuthService {
  AuthService(this._authService);
  final AuthInterface _authService;

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    return _authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<bool> signUp(String email, String password) async {
    return _authService.signUp(
      email: email,
      password: password,
    );
  }

  Future<bool> mailVerification(String email, String password) async {
    return _authService.mailVerificationPage();
  }
}
