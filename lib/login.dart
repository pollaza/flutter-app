import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api_provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  void performLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    ApiProvider()
        .login(username, password)
        .then((_) => Navigator.pushNamed(context, 'home'))
        .catchError((err) => print(err));
    // print('login attempt: $username with $password');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.white,
        child: Container(
          padding: EdgeInsets.all(20),
          child: SafeArea(
              child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 10),
                  child: Text('Pollaza',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          height: 1.6)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text('Venga venga, fresquitas las apuestas!'),
                ),
                CupertinoTextField(
                    placeholder: 'Username',
                    controller: _usernameController,
                    style: TextStyle(
                      fontSize: 16.0,
                      height: 1.5,
                    )),
                Container(
                    margin: EdgeInsets.only(top: 12),
                    child: CupertinoTextField(
                      placeholder: 'Password',
                      obscureText: true,
                      controller: _passwordController,
                      style: TextStyle(
                        fontSize: 16.0,
                        height: 1.5,
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: CupertinoButton.filled(
                      child: Text('Ingresar'),
                      onPressed: performLogin,
                    ))
              ],
            ),
          )),
        ));
  }
}
