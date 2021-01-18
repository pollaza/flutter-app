import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api_provider.dart';
import 'globals.dart';

class MyDrawer extends StatelessWidget {
  _gotoPage(String route, BuildContext context) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        padding: EdgeInsets.only(top: 100, left: 20),
        children: <Widget>[
          new ListTile(
            title: new Text(
              'Menu',
              style: new TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // change app state...
              _gotoPage("/rankings", context);
            },
          ),
          new ListTile(
            leading: new Icon(CupertinoIcons.list_number),
            title: new Text('Posiciones'),
            onTap: () {
              // change app state...
              _gotoPage("/rankings", context);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.info_outline_rounded),
            title: new Text('Resultados'),
            onTap: () {
              // change app state...
              _gotoPage("/matches", context);
            },
          ),
          new ListTile(
            leading: new Icon(CupertinoIcons.pencil_circle),
            title: new Text('Predicciones'),
            onTap: () {
              // change app state...
              _gotoPage("/bet", context);
            },
          ),
          new ListTile(
              leading: new Icon(CupertinoIcons.person_alt_circle),
              title: new Text('Perfil'),
              onTap: () {
                // change app state...
                _gotoPage("/profile", context);
              }),
          new ListTile(
              title: Text('Logout'),
              onTap: () {
                ApiProvider().logout().then((value) => {
                      Globals.isLoggedIn = false,
                      Globals.username = "",
                      //Navigator.of(context)
                      //  .pushNamedAndRemoveUntil("login", (route) => false)
                    });
              }),
        ],
      ),
    );
  }
}
