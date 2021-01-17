import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  _gotoPage(String route, BuildContext context) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          new ListTile(
            leading: new Icon(CupertinoIcons.list_number),
            title: new Text('Posiciones'),
            onTap: () {
              // change app state...
              _gotoPage("/rankings", context);
            },
          ),
          new ListTile(
            leading: new Icon(CupertinoIcons.bars),
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
            },
          ),
        ],
      ),
    );
  }
}
