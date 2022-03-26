import 'package:flutter/material.dart';
import 'package:send_mail/features/Splash/presentation/ui/splash_page.dart';
import 'package:send_mail/features/app/presentation/ui/bloc/route/route_cubit.dart';
import 'package:send_mail/features/home/presentation/ui/home_page.dart';
import 'package:send_mail/features/login/presentation/ui/login_page.dart';
import 'package:send_mail/features/login/presentation/ui/mail_verification_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteDelegate extends RouterDelegate<RouteState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  RouteState _currentState = RouteState.splash();

  RouteDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  RouteState get currentConfiguration => _currentState;

  final _splashKey = const ValueKey('Splash screen');
  final _loginKey = const ValueKey('login screen');
  final _mailVerificationKey = const ValueKey('Email Verification screen');
  final _homeKey = const ValueKey('Home screen');

  List<Page<dynamic>> _getPages() {
    List<Page<dynamic>> pages = [
      MaterialPage<void>(
        key: _splashKey,
        child: const SplashPage(),
      ),
    ]; //default

    _currentState.when(
      splash: () {
        pages = [
          MaterialPage<void>(
            key: _splashKey,
            child: const SplashPage(),
          ),
        ];
      },
      login: () {
        pages = [
          MaterialPage<void>(
            key: _loginKey,
            child: const LoginPage(),
          ),
        ];
      },
      mailVerification: () {
        pages = [
          MaterialPage<void>(
            key: _mailVerificationKey,
            child: const MailVerificationPage(),
          ),
        ];
      },
      home: () {
        pages = [
          MaterialPage<void>(
            key: _homeKey,
            child: const HomePage(),
          ),
        ];
      },
    );

    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<RouteCubit>(context),
      listener: (BuildContext context, RouteState state) {
        _currentState = state;
        notifyListeners();
      },
      child: Navigator(
        pages: _getPages(),
        onPopPage: (route, result) {
          //we dont' want to pop any further than this navigator
          return false;
        },
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(RouteState configuration) async {
    _currentState = configuration;
    notifyListeners();
  }
}
