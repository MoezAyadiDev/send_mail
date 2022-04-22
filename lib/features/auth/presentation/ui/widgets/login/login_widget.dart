import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:send_mail/commen/util/routes/app_router.dart';
import 'package:send_mail/features/auth/presentation/bloc/signin/login_cubit.dart';
import 'package:send_mail/features/auth/presentation/ui/widgets/login/email_widget.dart';
import 'package:send_mail/features/auth/presentation/ui/widgets/login/password_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RoundedLoadingButtonController _btnController =
        RoundedLoadingButtonController();
    Future<void> _submissionFail() async {
      _btnController.error();
      await Future.delayed(const Duration(milliseconds: 600));
      _btnController.reset();
    }

    Future<void> _submissionSucces() async {
      _btnController.success();
      await Future.delayed(const Duration(milliseconds: 600));
      _btnController.reset();
    }

    return Center(
      child: SizedBox(
        width: 400,
        child: ListView(
          children: [
            BlocListener<LoginCubit, LoginState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status,
              listener: (context, state) {
                if (state.status == FormzStatus.submissionFailure) {
                  _submissionFail();
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                } else if (state.status == FormzStatus.submissionSuccess) {
                  _submissionSucces();
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  const EmailWidget(),
                  const SizedBox(height: 10),
                  const PasswordWidget(),
                  const SizedBox(height: 20),
                  RoundedLoadingButton(
                    child: const Text(
                      'Validate',
                      style: TextStyle(color: Colors.white),
                    ),
                    controller: _btnController,
                    onPressed: () =>
                        BlocProvider.of<LoginCubit>(context).validate(),
                  ),
                  const SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      context.goNamed(Routes.signupName);
                    },
                    child: const Text('Sign up'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
