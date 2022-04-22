import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:send_mail/features/app/presentation/ui/bloc/cubit/session_cubit.dart';
import 'package:send_mail/features/auth/presentation/ui/login_page.dart';
import 'package:send_mail/features/auth/presentation/ui/mail_verification_page.dart';
import 'package:send_mail/features/auth/presentation/ui/signup_page.dart';
import 'package:send_mail/features/home/presentation/ui/home_page.dart';

GoRouter appRourter(BuildContext context, String? initialLocation) => GoRouter(
      initialLocation: initialLocation ?? Routes.splashPath,
      debugLogDiagnostics: true,
      urlPathStrategy: UrlPathStrategy.path,
      refreshListenable:
          GoRouterRefreshStream(context.read<SessionCubit>().stream),
      routes: [
        GoRoute(
          name: Routes.loginName,
          path: Routes.loginPath,
          builder: (context, state) {
            return const LoginPage();
          },
          routes: [
            GoRoute(
              path: Routes.signupPath,
              name: Routes.signupName,
              builder: (context, state) {
                return const SignUpPage();
              },
            ),
            GoRoute(
              path: Routes.mailVerificationPath,
              name: Routes.mailVerificationName,
              builder: (context, state) {
                return const MailVerificationPage();
              },
            ),
          ],
        ),
        GoRoute(
          name: Routes.homeName,
          path: Routes.homePath,
          builder: (context, state) {
            return const HomePage();
          },
        ),
      ],
      redirect: (state) {
        final loggedIn = context.read<SessionCubit>().state.isAuthenticated;
        final loggingIn = state.subloc == Routes.loginPath;
        final signingUp = state.subloc == '/login/' + Routes.signupPath;
        if (signingUp && !loggedIn) {
          return null;
        }

        if (!loggedIn) {
          return loggingIn ? null : Routes.loginPath;
        }
        if (loggingIn || (signingUp && loggedIn)) {
          return Routes.homePath;
        }

        return null;
      },
    );

class Routes {
  static const loginPath = '/login';
  static const homePath = '/home';
  static const splashPath = '/';
  static const signupPath = 'signup';
  static const mailVerificationPath = 'mailVerification';

  static const loginName = 'login';
  static const homeName = 'home';
  static const splashName = 'splash';
  static const signupName = 'signup';
  static const mailVerificationName = 'mailVerification';
}
