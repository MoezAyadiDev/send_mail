import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_mail/features/auth/presentation/bloc/signup/signup_cubit.dart';

class MailWidget extends StatelessWidget {
  const MailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          previous.email != current.email ||
          previous.checkField != current.checkField,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            icon: const Icon(Icons.email_rounded),
            hintText: 'Your mail adress',
            labelText: 'Email',
            errorText: (!state.email.valid && state.checkField)
                ? state.email.value == ''
                    ? 'Email can\'t be empty'
                    : 'invalid username'
                : null,
          ),
          onChanged: (value) {
            BlocProvider.of<SignupCubit>(context).emailChanged(value);
          },
        );
      },
    );
  }
}
