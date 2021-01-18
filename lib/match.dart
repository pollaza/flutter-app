import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pollaza/match_detail.dart';
import 'globals.dart';
import 'match_info.dart';
import 'country.dart';

class Match extends StatelessWidget {
  Match(
      {@required this.id,
      @required this.host,
      @required this.guest,
      @required this.hostFlag,
      @required this.guestFlag,
      @required this.result,
      @required this.date,
      @required this.hour,
      @required this.predictions,
      this.showOtherBets,
      this.isEditable,
      this.index});

  final String id;
  final int index;
  final String host;
  final String guest;
  final String hostFlag;
  final String guestFlag;
  final String result;
  final String date;
  final String hour;
  final bool showOtherBets;
  final bool isEditable;
  final List predictions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Country(
                name: host,
                flagImg: hostFlag,
                isEditable: isEditable,
                score: int.parse(result.split(":").first),
                onChange: (value) =>
                    {Globals.scores["scoresTeam1"][index] = value}),
            isEditable
                ? Text("vs")
                : MatchInfo(result: result, date: date, hour: hour),
            Country(
                name: guest,
                flagImg: guestFlag,
                isEditable: isEditable,
                score: int.parse(result.split(":").last),
                onChange: (value) =>
                    {Globals.scores["scoresTeam2"][index] = value}),
            this.showOtherBets
                ? GestureDetector(
                    child: Container(
                      child: Icon(
                        CupertinoIcons.chevron_forward,
                        size: 25.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                    onTap: () {
                      //Got to detail page
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MatchDetail(
                                  id: this.id, predictions: this.predictions)));
                    },
                  )
                : Container()
          ],
        ),
      ]),
    );
  }
}
