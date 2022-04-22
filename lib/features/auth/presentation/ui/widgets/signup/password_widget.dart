import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_mail/features/auth/presentation/bloc/signup/signup_cubit.dart';

class PassWidget extends StatelessWidget {
  const PassWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          previous.checkField != current.checkField ||
          previous.password != current.password ||
          previous.showPassword != current.showPassword,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            icon: const Icon(Icons.lock_open_rounded),
            hintText: 'Your password',
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(
                state.showPassword
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
              ),
              onPressed: () {
                BlocProvider.of<SignupCubit>(context).visibilityChanged();
              },
            ),
            errorText: (!state.password.valid && state.checkField)
                ? state.email.value == ''
                    ? 'Password can\'t be empty'
                    : 'invalid password'
                : null,
          ),
          obscureText: state.showPassword ? false : true,
          onChanged: (value) {
            BlocProvider.of<SignupCubit>(context).passwordChanged(value);
          },
        );
      },
    );
  }
}
