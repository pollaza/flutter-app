import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pollaza/api_provider.dart';

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
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: Center(child: Text("Nombre: " + Globals.username))),
                CupertinoButton.filled(
                  child: Text('Logout'),
                  onPressed: () {
                    ApiProvider().logout().then((value) => {
                          Globals.isLoggedIn = false,
                          Globals.username = "",
                          Navigator.pop(context)
                        });
                  },
                ),
              ],
            )));
  }
}
