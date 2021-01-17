import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'match.dart';

class Bet extends StatefulWidget {
  Bet({@required this.phase});

  final int phase;

  @override
  _BetState createState() => _BetState();
}

class _BetState extends State<Bet> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new MyDrawer(),
        appBar: AppBar(title: Text("Predicciones")),
        body: new Container(
            margin: EdgeInsets.all(14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Match(
                    host: 'Bolivia',
                    guest: 'Argentina',
                    hostFlag:
                        '//ssl.gstatic.com/onebox/media/sports/logos/SGxeD7yhwPj53FmPBmMMHg_48x48.png',
                    guestFlag:
                        '//ssl.gstatic.com/onebox/media/sports/logos/1xBWyjjkA6vEWopPK3lIPA_48x48.png',
                    date: '2020-10-13',
                    hour: '15:00',
                    result: '1:2',
                    showOtherBets: false,
                    isEditable: true,
                  ),
                ),
                CupertinoButton.filled(
                  child: Text('Guardar'),
                  onPressed: () {
                    /** Save Bets Action */
                  },
                ),
              ],
            )));
  }
}
