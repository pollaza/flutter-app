import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pollaza/api_provider.dart';
import 'drawer.dart';
import 'match.dart';
import 'package:intl/intl.dart';

import 'match_detail.dart';

class Matches extends StatefulWidget {
  Matches();

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> with AfterLayoutMixin<Matches> {
  String phase = "";
  var matches = [];
  final routes = <String, WidgetBuilder>{'detail': (context) => MatchDetail()};

  @override
  void afterFirstLayout(BuildContext context) {
    ApiProvider().getScores().then((response) => setState(() {
          phase = response["phase"]["title"].toString();
          matches = response["matches"];
        }));
  }

  @override
  Widget build(BuildContext context) {
    List<Match> rows = new List<Match>();
    for (var match in matches) {
      rows.add(Match(
          host: match["team1"]["title"].toString(),
          guest: match["team2"]["title"].toString(),
          hostFlag: match["team1"]["flag"].toString(),
          guestFlag: match["team2"]["flag"].toString(),
          result: match["team1Score"].toString() +
              ":" +
              match["team2Score"].toString(),
          date: DateFormat('yyyy-MM-dd').format(DateTime.parse(match["date"])),
          hour:
              DateFormat(r'''HH'h'mm''').format(DateTime.parse(match["date"])),
          showOtherBets: match["closed"],
          isEditable: false));
    }
    return new Scaffold(
        drawer: new MyDrawer(),
        appBar: AppBar(title: Text("Resultados")),
        body: new ListView(children: rows));
  }
}
