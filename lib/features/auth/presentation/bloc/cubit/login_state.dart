part of 'login_cubit.dart';

enum Validation { none, loading, succes, fail }

@immutable
class LoginState extends Equatable {
  final String email;
  final String password;
  final Validation status;
  const LoginState({
    this.email = '',
    this.password = '',
    this.status = Validation.none,
  });

  LoginState copyWith({
    String? email,
    String? password,
    Validation? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password];
}
