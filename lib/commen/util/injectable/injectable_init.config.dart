// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../features/app/presentation/ui/bloc/cubit/session_cubit.dart'
    as _i7;
import '../../../features/auth/application/services/auth_service.dart' as _i5;
import '../../../features/auth/domain/interfaces/auth_interface.dart' as _i3;
import '../../../features/auth/infrastracture/repositories/auth_repository.dart'
    as _i4;
import '../../../features/auth/presentation/bloc/cubit/login_cubit.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AuthInterface>(_i4.AuthRepository());
  gh.singleton<_i5.AuthService>(_i5.AuthService(get<_i3.AuthInterface>()));
  gh.factory<_i6.LoginCubit>(() => _i6.LoginCubit(get<_i5.AuthService>()));
  gh.singleton<_i7.SessionCubit>(_i7.SessionCubit(get<_i3.AuthInterface>()));
  return get;
}
