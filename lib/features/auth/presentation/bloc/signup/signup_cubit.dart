import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:send_mail/commen/util/validation/email_validator.dart';
import 'package:send_mail/commen/util/validation/password_validator.dart';
import 'package:send_mail/commen/util/validation/string_validator.dart';
import 'package:send_mail/features/auth/application/services/auth_service.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final AuthService _service;

  SignupCubit(AuthService signInService)
      : _service = signInService,
        super(const SignupState());

  emailChanged(String email) {
    final _email = Email.dirty(email);
    emit(
      state.copyWith(
        email: _email,
        status: Formz.validate([state.password, _email, state.name]),
      ),
    );
  }

  passwordChanged(String password) {
    final _password = Password.dirty(password);
    emit(
      state.copyWith(
        password: _password,
        status: Formz.validate([_password, state.email, state.name]),
      ),
    );
  }

  nameChanged(String name) {
    final _name = StringValidator.dirty(name);
    emit(
      state.copyWith(
        name: _name,
        status: Formz.validate([state.password, state.email, _name]),
      ),
    );
  }

  visibilityChanged() {
    emit(
      state.copyWith(
        showPassword: !state.showPassword,
      ),
    );
  }

  Future<void> validate() async {
    if (state.status.isValidated) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionInProgress,
          message: '',
        ),
      );
      var _result = await _service.signUp(
        state.email.value,
        state.password.value,
        state.name.value,
      );
      _result.fold(
        (l) {
          debugPrint('cubit signUp Failure ' + l.message!);
          emit(
            state.copyWith(
              status: FormzStatus.submissionFailure,
              message: l.message,
            ),
          );
        },
        (r) {
          emit(
            state.copyWith(
              status: FormzStatus.submissionSuccess,
              message: '',
            ),
          );
        },
      );
    } else {
      emit(
        state.copyWith(checkField: true),
      );
    }
  }
}
