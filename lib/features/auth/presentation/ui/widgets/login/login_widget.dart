import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                return Column(
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
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
