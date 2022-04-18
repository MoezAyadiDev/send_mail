import 'package:formz/formz.dart';

enum PasswordValidationError { empty }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    return (value?.isNotEmpty == true)
        ? (value!.length > 5)
            ? null
            : PasswordValidationError.empty
        : PasswordValidationError.empty;
  }
}
