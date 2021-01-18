import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pollaza/match_detail.dart';
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
      this.isEditable});

  final String id;
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
                score: int.parse(result.split(":").first)),
            isEditable
                ? Text("vs")
                : MatchInfo(result: result, date: date, hour: hour),
            Country(
                name: guest,
                flagImg: guestFlag,
                isEditable: isEditable,
                score: int.parse(result.split(":").last)),
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
                      print("Tapped on match");
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
