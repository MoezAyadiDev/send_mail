import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable_init.config.dart';

final getIt = GetIt.instance;

@injectableInit
GetIt configureDependencies() => $initGetIt(getIt);
