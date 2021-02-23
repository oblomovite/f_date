import 'package:f_date/blocs/authentication_bloc.dart';
import 'package:f_date/blocs/authentication_bloc/events.dart';
import 'package:f_date/pages/quiz_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Landing page shown on successful authentication.
class WelcomePage extends StatelessWidget {
  const WelcomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(context.localize("title")),
        title: Text("title"),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () =>
                // context.bloc<AuthenticationBloc>().add(LoggedOut()),
                context.read<AuthenticationBloc>().add(LoggedOut()),
          )
        ],
      ),
      body: Center(
        // child: Text(context.localize("welcome")),
        // child: Text("welcome"),
        child: QuizList(),
      ),
    );
  }
}
