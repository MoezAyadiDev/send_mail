import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:send_mail/features/auth/presentation/bloc/cubit/login_cubit.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.status != current.status,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            icon: const Icon(Icons.person),
            hintText: 'Your password',
            labelText: 'Password',
            errorText: (state.password.invalid && !state.status.isValid)
                ? 'invalid password'
                : null,
          ),
          onChanged: (value) {
            BlocProvider.of<LoginCubit>(context).passwordChanged(value);
          },
        );
      },
    );
  }
}
