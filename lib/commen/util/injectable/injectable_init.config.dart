// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../features/app/presentation/ui/bloc/cubit/session_cubit.dart'
    as _i8;
import '../../../features/auth/application/services/auth_service.dart' as _i6;
import '../../../features/auth/domain/interfaces/auth_interface.dart' as _i4;
import '../../../features/auth/infrastracture/data_sources/firebase_datasource.dart'
    as _i3;
import '../../../features/auth/infrastracture/repositories/auth_repository.dart'
    as _i5;
import '../../../features/auth/presentation/bloc/signin/login_cubit.dart'
    as _i7;
import '../../../features/auth/presentation/bloc/signup/signup_cubit.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.FirebaseDataSource>(_i3.FirebaseDataSource());
  gh.singleton<_i4.AuthInterface>(
      _i5.AuthRepository(get<_i3.FirebaseDataSource>()));
  gh.singleton<_i6.AuthService>(_i6.AuthService(get<_i4.AuthInterface>()));
  gh.factory<_i7.LoginCubit>(() => _i7.LoginCubit(get<_i6.AuthService>()));
  gh.singleton<_i8.SessionCubit>(_i8.SessionCubit(get<_i4.AuthInterface>()));
  gh.factory<_i9.SignupCubit>(() => _i9.SignupCubit(get<_i6.AuthService>()));
  return get;
}
