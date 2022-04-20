import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:send_mail/features/auth/presentation/bloc/cubit/login_cubit.dart';
import 'package:send_mail/features/auth/presentation/ui/widgets/login/email_widget.dart';
import 'package:send_mail/features/auth/presentation/ui/widgets/login/password_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
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
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<LoginCubit>(context).validate();
                    },
                    child: const Text('Validate'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
