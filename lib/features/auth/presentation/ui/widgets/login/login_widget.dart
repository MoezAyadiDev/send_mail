import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_mail/features/auth/presentation/bloc/cubit/login_cubit.dart';

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
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Your mail adress',
                        labelText: 'Email',
                      ),
                      onChanged: (value) {
                        BlocProvider.of<LoginCubit>(context)
                            .emailChanged(value);
                      },
                      validator: (String? value) {
                        return (value != null && !value.contains('@'))
                            ? 'Not a valid Email'
                            : null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock_open),
                        hintText: 'Your password',
                        labelText: 'Password',
                      ),
                      onChanged: (value) {
                        BlocProvider.of<LoginCubit>(context)
                            .passwordChanged(value);
                      },
                    ),
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
