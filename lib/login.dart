import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ots/ots.dart';
import 'api_provider.dart';
import 'globals.dart';

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
    showLoader(isModal: true);
    ApiProvider()
        .login(username, password)
        .then((response) => {
              hideLoader(),
              if (response["isSuccess"])
                {
                  Globals.username = response["user"]["email"],
                  Globals.avatar = response["user"]["photo"].toString(),
                  Globals.isLoggedIn = true,
                  Navigator.pushNamed(context, 'home')
                }
              else
                {
                  showNotification(
                    title: 'Error',
                    message: 'Tu usuario o clave no son correctos',
                    backgroundColor: Colors.redAccent,
                    autoDismissible: true,
                    notificationDuration: 2500,
                  )
                }
            })
        .catchError((err) => print(err));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.white,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('assets/field.jpg'),
                  fit: BoxFit.fitHeight)),
          child: SafeArea(
              child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 10),
                  child: Text('QATAR 2022',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.6)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.amber),
                  ),
                ),
                CupertinoTextField(
                    placeholder: 'Usuario',
                    controller: _usernameController,
                    style: TextStyle(
                      fontSize: 16.0,
                      height: 1.5,
                    )),
                Container(
                    margin: EdgeInsets.only(top: 12),
                    child: CupertinoTextField(
                      placeholder: 'Contraseña',
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
