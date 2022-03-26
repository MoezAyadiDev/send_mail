part of 'route_cubit.dart';

@freezed
abstract class RouteState with _$RouteState {
  factory RouteState.splash() = _splash;
  factory RouteState.login() = _login;
  factory RouteState.mailVerification() = _mailVerification;
  factory RouteState.home() = _home;
}
