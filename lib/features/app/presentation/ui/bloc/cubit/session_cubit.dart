import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:send_mail/features/auth/domain/entities/user.dart';
import 'package:send_mail/features/auth/domain/interfaces/auth_interface.dart';

part 'session_state.dart';

@Singleton()
class SessionCubit extends Cubit<SessionState> {
  final AuthInterface _authenticationGateway;
  late final StreamSubscription<User?> _userSubscription;

  SessionCubit(AuthInterface authenticationGateway)
      : _authenticationGateway = authenticationGateway,
        super(
          (authenticationGateway.currentUser != null)
              ? SessionState.authenticated(authenticationGateway.currentUser!)
              : const SessionState.unauthenticated(),
        ) {
    _userSubscription = _authenticationGateway.user.listen(
      (user) => onAppUserChanged(user),
    );
  }
  onAppUserChanged(User? user) {
    emit(
      user != null
          ? SessionState.authenticated(user)
          : const SessionState.unauthenticated(),
    );
  }

  onLogoutRequested() {
    unawaited(_authenticationGateway.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
