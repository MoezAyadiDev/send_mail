import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_mail/features/app/presentation/ui/bloc/cubit/session_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<SessionCubit>(context).onLogoutRequested();
            },
            icon: const Icon(Icons.logout_rounded),
          )
        ],
      ),
    );
  }
}
