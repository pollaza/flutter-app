import 'package:flutter/cupertino.dart';
import 'home.dart';
import 'login.dart';
import 'match_detail.dart';

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
    return CupertinoApp(
      title: 'Pollaza',
      routes: routes,
      home: Login(),
    );
  }
}
