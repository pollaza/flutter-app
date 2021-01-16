import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:pollaza/api_provider.dart';
import 'match.dart';
import 'package:intl/intl.dart';

class Matches extends StatefulWidget {
  Matches();

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> with AfterLayoutMixin<Matches> {
  String phase = "";
  List<Widget> matches = new List<Widget>();

  @override
  void afterFirstLayout(BuildContext context) {
    ApiProvider().getScores().then((response) => {
          setState(() {
            phase = response["phase"]["title"].toString();
            for (var m in response["matches"]) {
              bool isClosed = m["closed"] == "true";
              matches.add(Match(
                  host: m["team1"]["title"].toString(),
                  guest: m["team2"]["title"].toString(),
                  hostFlag: m["team1"]["flag"].toString(),
                  guestFlag: m["team2"]["flag"].toString(),
                  result: m["team1Score"].toString() +
                      ":" +
                      m["team2Score"].toString(),
                  date: DateFormat('yyyy-MM-dd')
                      .format(DateTime.parse(m["date"])),
                  hour: DateFormat(r'''HH'h'mm''')
                      .format(DateTime.parse(m["date"])),
                  showOtherBets: isClosed,
                  isEditable: false));
            }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: matches);
    // return Container(
    //     margin: EdgeInsets.all(14),
    //     child: Column(children: [
    //       Text(
    //         "Resultados - " + phase,
    //         style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
    //       ),
    //       ListView(children: matches)
    //     ]));
  }
}
