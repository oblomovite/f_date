import 'package:f_date/blocs/authentication_bloc/bloc.dart';
import 'package:f_date/blocs/authentication_bloc/events.dart';
import 'package:f_date/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';
import 'events.dart';

/// Manages the login state of the app
class CredentialsBloc extends Bloc<CredentialsEvent, CredentialState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  CredentialsBloc({
    required this.authenticationBloc,
    required this.userRepository,
  }) : super(CredentialsInitial());

  @override
  Stream<CredentialState> mapEventToState(CredentialsEvent event) async* {
    if (event is LoginButtonPressed) {
      yield* _loginPressed(event);
    }

    if (event is RegisterButtonPressed) {
      yield* _registerPressed(event);
    }
  }

  Stream<CredentialState> _loginPressed(CredentialsEvent event) async* {
    yield CredentialsLoginLoading();

    try {
      final success =
          await userRepository.authenticate(event.username, event.password);
      if (success) {
        authenticationBloc.add(const LoggedIn());
        yield CredentialsInitial();
      } else {
        yield CredentialsLoginFailure();
      }
    } on FirebaseAuthException {
      yield CredentialsLoginFailure();
    }
  }

  Stream<CredentialState> _registerPressed(CredentialsEvent event) async* {
    yield CredentialsRegisterLoading();

    try {
      final success =
          await userRepository.register(event.username, event.password);
      if (success) {
        authenticationBloc.add(const LoggedIn());
        yield CredentialsInitial();
      } else {
        yield CredentialsRegisterFailure();
      }
    } on FirebaseAuthException {
      yield CredentialsRegisterFailure();
    }

  }
}
