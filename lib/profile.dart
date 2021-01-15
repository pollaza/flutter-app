import 'package:flutter/cupertino.dart';

class Profile extends StatelessWidget {

  final String username = "Username";

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
                child: Center(child:Text("Nombre: "+ username))
              ),
            CupertinoButton.filled(
              child: Text('Logout'),
              onPressed: () { 
                
                /** 

                */
               },
            ),
          ],
        )
    );
  }
}