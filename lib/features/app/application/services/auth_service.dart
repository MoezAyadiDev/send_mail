import 'package:injectable/injectable.dart';
import 'package:send_mail/features/app/domain/entities/user.dart';

@singleton
class AuthService {
  User? _user;

  void login(String email, String password) {
    _user = User(email, password);
  }

  bool isLoggedIn() => _user != null;
}
