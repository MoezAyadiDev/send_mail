part of 'session_cubit.dart';

enum AppStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class SessionState extends Equatable {
  const SessionState._({
    required this.status,
    this.user,
  });

  const SessionState.authenticated(User user)
      : this._(status: AppStatus.authenticated, user: user);

  const SessionState.unauthenticated()
      : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final User? user;

  bool get isAuthenticated => status == AppStatus.authenticated;

  @override
  List<Object> get props => [status];
}
