import 'package:equatable/equatable.dart';

/// Events for the [AuthenticationBloc] bloc
abstract class AuthenticationEvent extends Equatable {
  /// base class for events fired by [AuthenticationBloc]
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

/// successful user login
class LoggedIn extends AuthenticationEvent {
  const LoggedIn();
}

/// User requested to logout
class LoggedOut extends AuthenticationEvent {
  const LoggedOut();
}
