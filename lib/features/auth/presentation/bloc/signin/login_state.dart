part of 'login_cubit.dart';

@immutable
class LoginState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus status;
  final bool checkField;
  final String message;
  final bool showPassword;
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.checkField = false,
    this.message = '',
    this.showPassword = false,
  });

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    bool? checkField,
    String? message,
    bool? showPassword,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      checkField: checkField ?? this.checkField,
      message: message ?? this.message,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        status,
        checkField,
        message,
        showPassword,
      ];
}
