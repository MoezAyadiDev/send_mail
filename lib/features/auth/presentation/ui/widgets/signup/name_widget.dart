import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_mail/features/auth/presentation/bloc/signup/signup_cubit.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          previous.email != current.email ||
          previous.checkField != current.checkField,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            icon: const Icon(Icons.person),
            hintText: 'Your user name',
            labelText: 'Name',
            errorText: (!state.email.valid && state.checkField)
                ? state.email.value == ''
                    ? 'user name can\'t be empty'
                    : 'invalid username'
                : null,
          ),
          onChanged: (value) {
            BlocProvider.of<SignupCubit>(context).nameChanged(value);
          },
        );
      },
    );
  }
}
