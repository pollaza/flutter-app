import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ots/ots.dart';
import 'package:pollaza/globals.dart';
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
  var ids = [];
  var scores = {"scoresTeam1": [], "scoresTeam2": []};

  @override
  void afterFirstLayout(BuildContext context) {
    showLoader(isModal: true);
    ApiProvider().getBets().then((response) => setState(() {
          matches = response["matches"];
          predictions = {
            "team1": response["scoresTeam1"],
            "team2": response["scoresTeam2"]
          };
          scores["scoresTeam1"] = response["scoresTeam1"];
          scores["scoresTeam2"] = response["scoresTeam2"];
        }));
  }

  @override
  Widget build(BuildContext context) {
    var rows = <Widget>[];
    ids = [];
    int i = 0;
    int j = 0;
    for (var match in matches) {
      inspect(match);
      if (!match["closed"]) {
        ids.add(match["sys"]["id"].toString());
        Globals.scores["scoresTeam1"].add(predictions["team1"][j]);
        Globals.scores["scoresTeam2"].add(predictions["team2"][j]);
        rows.add(
          new Container(
            child: Match(
                id: match["sys"]["id"].toString(),
                host: match["team1"]["title"].toString(),
                guest: match["team2"]["title"].toString(),
                hostFlag: match["team1"]["flag"].toString(),
                guestFlag: match["team2"]["flag"].toString(),
                result: predictions["team1"][j].toString() +
                    ":" +
                    predictions["team2"][j].toString(),
                date: DateFormat('yyyy-MM-dd')
                    .format(DateTime.parse(match["date"])),
                hour: DateFormat(r'''HH'h'mm''')
                    .format(DateTime.parse(match["date"])),
                predictions: [],
                showOtherBets: false,
                isEditable: true,
                index: i),
          ),
        );
        i++;
      }
      j++;
    }

    hideLoader();
    return new Scaffold(
        drawer: new MyDrawer(),
        appBar: AppBar(title: Text("Predicciones"), actions: [
          IconButton(
              icon: Icon(Icons.cloud_upload),
              onPressed: () => {
                    showLoader(isModal: true),
                    ApiProvider()
                        .putBets(ids, Globals.scores["scoresTeam1"],
                            Globals.scores["scoresTeam2"])
                        .then((success) => {
                              hideLoader(),
                              if (success)
                                {
                                  showNotification(
                                    title: 'Ok',
                                    message: 'Tus cambios han sido grabados',
                                    backgroundColor: Colors.lightBlue,
                                    autoDismissible: true,
                                    notificationDuration: 2500,
                                  )
                                }
                              else
                                {
                                  showNotification(
                                    title: 'Error',
                                    message:
                                        'Tus cambios no se pudieron grabar',
                                    backgroundColor: Colors.redAccent,
                                    autoDismissible: true,
                                    notificationDuration: 2500,
                                  )
                                }
                            })
                  }),
          Text("     ")
        ]),
        body: new ListView(children: rows));
  }
}
