import 'package:equatable/equatable.dart';

/// States emitted by [AuthenticationBloc]
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

/// App just opened, login or register actions required
class AuthenticationInit extends AuthenticationState {
  const AuthenticationInit();
}

/// Login made with success
class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess();
}

/// Logout
class AuthenticationRevoked extends AuthenticationState {
  const AuthenticationRevoked();
}

/// Loading (awaiting registration or authentication)
class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();
}

/// Todo: handle timeouts, or do something with a failed login attempt
class AuthenticationError extends AuthenticationState {
  const AuthenticationError();
}
