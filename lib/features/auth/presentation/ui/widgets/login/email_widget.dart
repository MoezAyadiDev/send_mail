import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:send_mail/features/auth/presentation/bloc/cubit/login_cubit.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.email != current.email || previous.status != current.status,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            icon: const Icon(Icons.person),
            hintText: 'Your mail adress',
            labelText: 'Email',
            errorText: (state.email.invalid && !state.status.isValid)
                ? 'invalid username'
                : null,
          ),
          onChanged: (value) {
            BlocProvider.of<LoginCubit>(context).emailChanged(value);
          },
        );
      },
    );
  }
}
