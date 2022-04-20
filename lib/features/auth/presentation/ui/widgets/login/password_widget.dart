import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_mail/features/auth/presentation/bloc/cubit/login_cubit.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.checkField != current.checkField ||
          previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            icon: const Icon(Icons.lock_open_rounded),
            hintText: 'Your password',
            labelText: 'Password',
            errorText: (!state.password.valid && state.checkField)
                ? state.email.value == ''
                    ? 'Password can\'t be empty'
                    : 'invalid password'
                : null,
          ),
          obscureText: true,
          onChanged: (value) {
            BlocProvider.of<LoginCubit>(context).passwordChanged(value);
          },
        );
      },
    );
  }
}
