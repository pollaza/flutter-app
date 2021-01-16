import 'package:flutter/cupertino.dart';
import 'package:pollaza/api_provider.dart';

import 'globals.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(14),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Perfil",style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
            Container(
                height: MediaQuery.of(context).size.height*0.7,
                child: Center(child:Text("Nombre: "+ Globals.username))
              ),
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
        )
    );
  }
}