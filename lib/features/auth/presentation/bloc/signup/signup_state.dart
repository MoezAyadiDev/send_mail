part of 'signup_cubit.dart';

@immutable
class SignupState extends Equatable {
  final Email email;
  final Password password;
  final StringValidator name;
  final FormzStatus status;
  final bool checkField;
  final String message;
  final bool showPassword;
  const SignupState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.checkField = false,
    this.message = '',
    this.name = const StringValidator.pure(),
    this.showPassword = false,
  });

  SignupState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    bool? checkField,
    String? message,
    StringValidator? name,
    bool? showPassword,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      checkField: checkField ?? this.checkField,
      message: message ?? this.message,
      name: name ?? this.name,
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
        name,
        showPassword,
      ];
}
