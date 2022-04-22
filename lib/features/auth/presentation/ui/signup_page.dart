import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_mail/commen/util/injectable/injectable_init.dart';
import 'package:send_mail/features/auth/presentation/bloc/signup/signup_cubit.dart';
import 'package:send_mail/features/auth/presentation/ui/widgets/signup/signup_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login Page')),
        body: const SignupWidget(),
      ),
    );
  }
}
