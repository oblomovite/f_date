import 'package:f_date/blocs/login_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utils/separator.dart';

/// Actual login form with validation, asking for email and password
class LoginForm extends StatefulWidget {
  const LoginForm();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String validateEmail(String input) {
    if ((input.length > 10) && (input.contains("@"))) {
      return null;
    } else {
      // return context.localize("invalid_field");
      return "Invalid Field";
    }
  }

  String validatePassword(String input) {
    if (input.length > 5) {
      return null;
    } else {
      // return context.localize("invalid_field");
      return "Password Weak";
    }
  }

  void loginButtonPressed(BuildContext context) {
    // context.bloc<CredentialsBloc>()
    context.read<CredentialsBloc>().add(LoginButtonPressed(
        username: emailController.text, password: passwordController.text));
  }

  void registerButtonPressed(BuildContext context) {
    // context.bloc<CredentialsBloc>()
    context.read<CredentialsBloc>().add(RegisterButtonPressed(
        username: emailController.text, password: passwordController.text));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, data) {
      var baseWidth = 250.0;

      // For a wider screen
      if (data.maxWidth <= baseWidth) {
        baseWidth = data.maxWidth / 1.4;
      }

      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 70),
            const Separator(50),
            Form(
              key: formKey,
              child: Wrap(
                direction: Axis.vertical,
                spacing: 20,
                children: <Widget>[
                  SizedBox(
                    width: baseWidth - 38,
                    child: TextFormField(
                      validator: validateEmail,
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        // hintText: context.localize("username"),
                        hintText: "username",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: baseWidth - 30,
                    child: TextFormField(
                      obscureText: true,
                      validator: validatePassword,
                      controller: passwordController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.vpn_key),
                        // hintText: context.localize("password"),
                        hintText: "password",
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Separator(25),

            // Login
            BlocConsumer<CredentialsBloc, CredentialState>(
              listener: (context, state) {
                if (state is CredentialsLoginFailure) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    duration: const Duration(seconds: 2),
                    // content: Text(context.localize("error_login")),
                    content: Text("error_login"),
                  ));
                }
              },
              builder: (context, state) {
                if (state is CredentialsLoginLoading) {
                  return const CircularProgressIndicator();
                }
                return RaisedButton(
                  key: Key("loginButton"),
                  // child: Text(context.localize("login")),
                  child: Text("login"),
                  color: Colors.lightGreen,
                  textColor: Colors.white,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      loginButtonPressed(context);
                    }
                  },
                );
              },
            ),
            const Separator(5),

            // Register
            BlocConsumer<CredentialsBloc, CredentialState>(
                listener: (context, state) {
              if (state is CredentialsRegisterFailure) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 2),
                  // content: Text(context.localize("register_login")),
                  content: Text("register_login"),
                ));
              }
            }, builder: (context, state) {
              if (state is CredentialsRegisterLoading) {
                return const CircularProgressIndicator();
              }
              return RaisedButton(
                  key: Key("registerButton"),
                  // child: Text(context.localize("register")),
                  child: Text("register"),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      registerButtonPressed(context);
                    }
                  });
            })
          ],
        ),
      );
    });
  }

}
