import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ots/ots.dart';
import 'package:pollaza/globals.dart';
import 'home.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    'login': (context) => Login(),
    'home': (context) => Home()
  };

  @override
  Widget build(BuildContext context) {
    Globals.rootContext = context;
    return OTS(
        loader: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
          backgroundColor: Colors.grey,
        ),
        child: CupertinoApp(
          title: 'Pollaza',
          routes: routes,
          home: Login(),
        ));
  }
}
