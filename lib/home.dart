import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pollaza/login.dart';
import 'package:pollaza/profile.dart';
import 'rankings.dart';
import 'matches.dart';
import 'bet.dart';
import 'profile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Drawer Scaffold
    return new MaterialApp(
      routes: <String, WidgetBuilder>{
        "/rankings": (BuildContext context) => new Rankings(phase: 2),
        "/matches": (BuildContext context) => new Matches(),
        "/bet": (BuildContext context) => new Bet(phase: 2),
        "/profile": (BuildContext context) => new Profile()
      },
      initialRoute: "/rankings",
      title: 'Nav',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Login(),
    );
  }
}
