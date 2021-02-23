import 'package:f_date/blocs/authentication_bloc.dart';
import 'package:f_date/blocs/login_bloc.dart';
import 'package:f_date/pages/login_form.dart';
import 'package:f_date/repository/user_repository/firebase_repository.dart';
import 'package:f_date/repository/user_repository/test_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    // final repository = context.select((TestUserRepository u) => u);
    final repository = context.select((FirebaseUserRepository u) => u);

    // final authBloc = context.bloc<AuthenticationBloc>();
    final authBloc = context.read<AuthenticationBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('testing'),
      ),
      body: BlocProvider<CredentialsBloc>(
        create: (context) =>
        CredentialsBloc(authenticationBloc: authBloc, userRepository: repository),
        child: const Center(child: LoginForm()),
      ),
    );
  }
}
