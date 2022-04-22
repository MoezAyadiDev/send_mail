import 'package:formz/formz.dart';

enum StringValidatorError { empty }

class StringValidator extends FormzInput<String, StringValidatorError> {
  const StringValidator.pure() : super.pure('');
  const StringValidator.dirty([String value = '']) : super.dirty(value);

  @override
  StringValidatorError? validator(String? value) {
    return (value?.isNotEmpty == true)
        ? (value! != '')
            ? null
            : StringValidatorError.empty
        : StringValidatorError.empty;
  }
}
