import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:send_mail/features/auth/application/services/auth_service.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthService _service;

  LoginCubit(AuthService signInService)
      : _service = signInService,
        super(const LoginState());

  emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> validate() async {
    var _status = Validation.none;
    if (state.email == '') {
      _status = Validation.fail;
    }
    if (state.password == '') {
      _status = Validation.fail;
    }
    if (_status == Validation.fail) {
      emit(state.copyWith(status: _status));
    } else {
      emit(state.copyWith(status: Validation.loading));
      try {
        var _result = await _service.signInWithEmailAndPassword(
            state.email, state.password);
        if (_result) {
          emit(state.copyWith(status: Validation.succes));
        } else {
          emit(state.copyWith(status: Validation.fail));
        }
      } catch (_) {
        emit(state.copyWith(status: Validation.fail));
      }
    }
  }
}
