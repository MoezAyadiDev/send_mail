part of 'login_cubit.dart';

@immutable
class LoginState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus status;
  final bool checkField;
  final String message;
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.checkField = false,
    this.message = '',
  });

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    bool? checkField,
    String? message,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      checkField: checkField ?? this.checkField,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        status,
        checkField,
        message,
      ];
}
