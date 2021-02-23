import 'package:f_date/repository/quiz_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizPage extends StatefulWidget {
  const QuizPage();

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  @override
  Widget build(BuildContext context) {
    final repository = context.select((QuizRepository u) => u);

    return Scaffold(
        appBar: AppBar(
          title: Text('testing'),
        ),
        body: Text('quiz goes here')
        // body: BlocProvider<CredentialsBloc>(
        //   create: (context) =>
        //   CredentialsBloc(authenticationBloc: authBloc, userRepository: repository),
        //   child: const Center(child: LoginForm()),
        // ),
        );
  }
}
