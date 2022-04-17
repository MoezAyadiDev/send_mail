import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_mail/commen/util/injectable/injectable_init.dart';
import 'package:send_mail/commen/util/routes/app_router.dart';
import 'package:send_mail/features/app/presentation/ui/bloc/cubit/session_cubit.dart';

class SendMailApp extends StatelessWidget {
  const SendMailApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SessionCubit>(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = appRourter(context, null);

    return MaterialApp.router(
      routerDelegate: _appRouter.routerDelegate,
      routeInformationParser: _appRouter.routeInformationParser,
      debugShowCheckedModeBanner: false,
    );
  }
}
