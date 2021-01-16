

import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:pollaza/api_provider.dart';
import 'match.dart';

class Matches extends StatefulWidget {
  Matches();

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> with AfterLayoutMixin<Matches>{

  String phase = "";

  @override
  void afterFirstLayout(BuildContext context) {
    ApiProvider().getScores().then((response) => {
        setState(() {
          phase = response["phase"]["title"].toString();
          inspect(response);
        })
    });
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
        margin: EdgeInsets.all(14),
        child: Column(
          children: [
            Text(
              "Resultados - "+phase,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            Match(
              host: 'Bolivia',
              guest: 'Argentina',
              hostFlag:
                  'http://ssl.gstatic.com/onebox/media/sports/logos/SGxeD7yhwPj53FmPBmMMHg_48x48.png',
              guestFlag:
                  'http://ssl.gstatic.com/onebox/media/sports/logos/1xBWyjjkA6vEWopPK3lIPA_48x48.png',
              date: '2020-10-13',
              hour: '15:00',
              result: '1:2',
              showOtherBets: true,
              isEditable: false,
            )
          ],
        ));
  }
}