import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:send_mail/features/app/presentation/ui/bloc/cubit/session_cubit.dart';
import 'package:send_mail/features/auth/presentation/ui/login_page.dart';
import 'package:send_mail/features/auth/presentation/ui/mail_verification_page.dart';
import 'package:send_mail/features/auth/presentation/ui/signup_page.dart';
import 'package:send_mail/features/home/presentation/ui/home_page.dart';

GoRouter appRourter(BuildContext context, String? initialLocation) => GoRouter(
      initialLocation: initialLocation ?? Routes.splash,
      debugLogDiagnostics: true,
      refreshListenable:
          GoRouterRefreshStream(context.read<SessionCubit>().stream),
      routes: [
        GoRoute(
          path: Routes.login,
          builder: (context, state) {
            return const LoginPage();
          },
          routes: [
            GoRoute(
              path: Routes.signup,
              builder: (context, state) {
                return const SignUpPage();
              },
            ),
            GoRoute(
              path: Routes.mailVerification,
              builder: (context, state) {
                return const MailVerificationPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: Routes.home,
          builder: (context, state) {
            return const HomePage();
          },
        ),
      ],
      redirect: (state) {
        final loggedIn = context.read<SessionCubit>().state.isAuthenticated;
        final loggingIn = state.subloc == Routes.login;
        final signingUp = state.subloc == Routes.signup;

        if (signingUp) {
          return null;
        }

        if (!loggedIn) {
          return loggingIn ? null : Routes.login;
        }
        if (loggingIn) {
          return Routes.home;
        }

        return null;
      },
    );

class Routes {
  static const signup = 'login/signup';
  static const mailVerification = 'login/mailVerification';
  static const login = '/login';
  static const home = '/home';
  static const splash = '/';
}
