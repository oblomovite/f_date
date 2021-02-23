import 'package:equatable/equatable.dart';

/// States emitted by [LoginBloc]
abstract class CredentialState extends Equatable {
  const CredentialState();

  @override
  List<Object> get props => [];
}

// Action required (authentication or registration)
class CredentialsInitial extends CredentialState {
  const CredentialsInitial();
}

/// Login request awaiting response
class CredentialsLoginLoading extends CredentialState {
  const CredentialsLoginLoading();
}

/// Registration request awaiting response
class CredentialsRegisterLoading extends CredentialState {
  const CredentialsRegisterLoading();
}

/// Invalid authentication credentials
class CredentialsLoginFailure extends CredentialState {
  const CredentialsLoginFailure();
}

// Registration validation failure
class CredentialsRegisterFailure extends CredentialState {
  const CredentialsRegisterFailure();
}
