/// Old 
import 'package:flutter/widgets.dart';
import 'authentication_bloc.dart';

class AuthenticationBlocProvider extends InheritedWidget {
  final AuthenticationBloc authenticationBloc;

  const AuthenticationBlocProvider(
    {Key? key,
      required Widget child,
      required this.authenticationBloc})
  : super(
    key: key,
    child: child);

  static AuthenticationBlocProvider of(BuildContext context) {
    // allows children widgets to get the instance of the AuthenticationBlocProvider
    return (context.dependOnInheritedWidgetOfExactType(
        aspect: AuthenticationBlocProvider) as AuthenticationBlocProvider);
  }

  @override
  bool updateShouldNotify(AuthenticationBlocProvider old) =>
      authenticationBloc != old.authenticationBloc;
}
