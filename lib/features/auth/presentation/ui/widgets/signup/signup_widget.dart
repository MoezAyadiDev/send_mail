import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:send_mail/features/auth/presentation/bloc/signup/signup_cubit.dart';
import 'package:send_mail/features/auth/presentation/ui/widgets/signup/email_widget.dart';
import 'package:send_mail/features/auth/presentation/ui/widgets/signup/name_widget.dart';
import 'package:send_mail/features/auth/presentation/ui/widgets/signup/password_widget.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RoundedLoadingButtonController _btnController =
        RoundedLoadingButtonController();
    Future<void> _submissionFail() async {
      _btnController.error();
      await Future.delayed(const Duration(milliseconds: 600));
      _btnController.reset();
    }

    Future<void> _submissionSucces() async {
      _btnController.success();
      await Future.delayed(const Duration(milliseconds: 600));
      _btnController.reset();
    }

    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == FormzStatus.submissionFailure) {
          _submissionFail();
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else if (state.status == FormzStatus.submissionSuccess) {
          _submissionSucces();
        }
      },
      child: Center(
        child: SizedBox(
            width: 400,
            child: ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 10),
                    const MailWidget(),
                    const SizedBox(height: 10),
                    const NameWidget(),
                    const SizedBox(height: 10),
                    const PassWidget(),
                    const SizedBox(height: 20),
                    RoundedLoadingButton(
                      child: const Text(
                        'Validate',
                        style: TextStyle(color: Colors.white),
                      ),
                      controller: _btnController,
                      onPressed: () =>
                          BlocProvider.of<SignupCubit>(context).validate(),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
