import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'globals.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new MyDrawer(),
        appBar: AppBar(title: Text("Perfil")),
        body: Container(
            margin: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Container(
                        width: 190.0,
                        height: 190.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "http:" + Globals.avatar)))),
                  ],
                ),
                Row(children: [Text(" ")]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Center(
                      child: Text(Globals.username,
                          style: new TextStyle(fontWeight: FontWeight.bold)))
                ])
              ],
            )));
  }
}
