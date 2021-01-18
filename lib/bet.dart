import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'api_provider.dart';
import 'drawer.dart';
import 'match.dart';

class Bet extends StatefulWidget {
  Bet({@required this.phase});

  final int phase;

  @override
  _BetState createState() => _BetState();
}

class _BetState extends State<Bet> with AfterLayoutMixin<Bet> {
  String phase = "";
  var matches = [];
  var predictions = {};

  @override
  void afterFirstLayout(BuildContext context) {
    ApiProvider().getBets().then((response) => setState(() {
          matches = response["matches"];
          predictions = {
            "team1": response["scoresTeam1"],
            "team2": response["scoresTeam2"]
          };
          print(predictions);
        }));
  }

  @override
  Widget build(BuildContext context) {
    //inspect(predictions);
    var rows = <Widget>[];
    int i = 0;
    for (var match in matches) {
      rows.add(
        new Container(
          child: Match(
            id: match["sys"]["id"].toString(),
            host: match["team1"]["title"].toString(),
            guest: match["team2"]["title"].toString(),
            hostFlag: match["team1"]["flag"].toString(),
            guestFlag: match["team2"]["flag"].toString(),
            result: predictions["team1"][i].toString() +
                ":" +
                predictions["team2"][i].toString(),
            date:
                DateFormat('yyyy-MM-dd').format(DateTime.parse(match["date"])),
            hour: DateFormat(r'''HH'h'mm''')
                .format(DateTime.parse(match["date"])),
            predictions: [],
            showOtherBets: false,
            isEditable: true,
          ),
        ),
      );
      i++;
    }
    return new Scaffold(
        drawer: new MyDrawer(),
        appBar: AppBar(title: Text("Predicciones")),
        body: new ListView(children: rows));
  }
}
