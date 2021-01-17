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
  var matches = [];

  @override
  void afterFirstLayout(BuildContext context) {
    print("Getting scores...");
    ApiProvider().getScores().then((response) => setState(() {
          phase = response["phase"]["title"].toString();
          matches = response["matches"];
        }));
  }

  @override
  Widget build(BuildContext context) {
    List<Match> rows = new List<Match>();
    for (var match in matches) {
      bool isClosed = match["closematch"] == "true";
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
          showOtherBets: isClosed,
          isEditable: false));
    }
    return ListView(children: rows);
  }
}
