import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:send_mail/features/app/application/services/auth_service.dart';

part 'route_cubit.freezed.dart';
part 'route_state.dart';

@injectable
class RouteCubit extends Cubit<RouteState> {
  AuthService authService;

  RouteCubit(this.authService) : super(RouteState.splash()) {
    if (authService.isLoggedIn()) {
      emit(RouteState.home());
    } else {
      emit(RouteState.login());
    }
  }

  void login() {
    emit(RouteState.login());
  }

  void mailVerification() {
    emit(RouteState.mailVerification());
  }

  void logout() {
    emit(RouteState.login());
  }

  void home() {
    emit(RouteState.home());
  }
}
