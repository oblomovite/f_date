/*
Handles logging in a user or creating a new user

Instantiates the LoginBloc class by injecting 
the AuthenticationService() class by ovveriding the initState() method

The StreamBuilder widget is used to monitor the email and password values
TextField's onChanged property calls the _loginBloc.emailChanged/passwordChanged.add
to send the values to the sink and thus to the LoginBloc Validators class to enforce
appriopriate input

The StreamBuilder widget is used to list to the _loginBloc.loginOrCreateButton 
steam to toggle showing Login or Create Account as the default button

*/
import 'package:f_date/blocs/login_bloc.dart';
import 'package:f_date/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    // Note that the reason this is intialized here (and not didChangeDependencies())
    // is because the LoginBloc does not need a provider (InheritedWidget)
    super.initState();
    _loginBloc = LoginBloc(AuthenticationService());
  }




  @override
  Widget build(BuildContext context) {

    Column _buttonsCreateAccount() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          StreamBuilder(
            initialData: false,
            stream: _loginBloc.enableLoginCreateButton,
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                RaisedButton(
              elevation: 16.0,
              child: Text('Create Account'),
              color: Colors.lightGreen.shade200,
              disabledColor: Colors.grey.shade100,
              onPressed: snapshot.data
                  ? () => _loginBloc.loginOrCreateChanged.add('Create Account')
                  : null,
            ),
          ),
          FlatButton(
              child: Text('Login'),
              onPressed: () {
                _loginBloc.loginOrCreateButtonChanged.add('Login');
              })
        ],
      );
    }

    Column _buttonsLogin() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          StreamBuilder(
            initialData: false,
            stream: _loginBloc.enableLoginCreateButton,
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                RaisedButton(
              elevation: 16.0,
              child: Text('Login'),
              color: Colors.lightGreen.shade200,
              disabledColor: Colors.grey.shade100,
              onPressed: snapshot.data
                  ? () => _loginBloc.loginOrCreateChanged.add('Login')
                  : null,
            ),
          ),
          FlatButton(
              child: Text('Create Account'),
              onPressed: () {
                _loginBloc.loginOrCreateButtonChanged.add('Create Account');
              })
        ],
      );
    }

    Widget _buildLoginAndCreateButtons() {
      return StreamBuilder(
        initialData: 'Login',
        stream: _loginBloc.loginOrCreateButton,
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == 'Login') {
            return _buttonsLogin();
          } else if (snapshot.data == 'Create Account') {
            return _buttonsCreateAccount();
          }
        }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: Icon(
            Icons.account_circle,
            size: 88.0,
            color: Colors.white,
          ),
          preferredSize: Size.fromHeight(40.0),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: 16.0, top: 32.0, left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              StreamBuilder(
                stream: _loginBloc.email,
                builder: (BuildContext context, AsyncSnapshot snapshot) =>
                    TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: _loginBloc.emailChanged.add,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    icon: Icon(Icons.mail_outline),
                    errorText: snapshot.error,
                  ),
                ),
              ),
              StreamBuilder(
                stream: _loginBloc.password,
                builder: (BuildContext context, AsyncSnapshot snapshot) =>
                    TextField(
                  obscureText: true,
                  onChanged: _loginBloc.passwordChanged.add,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    icon: Icon(Icons.security),
                    errorText: snapshot.error,
                  ),
                ),
              ),
              SizedBox(height: 48.0),
              _buildLoginAndCreateButtons(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
