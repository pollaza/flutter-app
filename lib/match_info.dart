import 'dart:ui';

import 'package:flutter/cupertino.dart';

class MatchInfo extends StatefulWidget {
  MatchInfo({@required this.result, @required this.date, @required this.hour});

  final String result;
  final String date;
  final String hour;

  @override
  _MatchInfoState createState() => _MatchInfoState();
}

class _MatchInfoState extends State<MatchInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      child: Column(
        children: [
          Row(children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Text(widget.date + " | " + widget.hour,
                    style: TextStyle(fontSize: 14, height: 2)))
          ]),
          Container(
            width: 150,
            decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.inactiveGray),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              widget.result,
              style: TextStyle(
                  fontWeight: FontWeight.w700, letterSpacing: 4, fontSize: 18),
            ),
            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
            margin: EdgeInsets.only(bottom: 6),
          ),
        ],
      ),
    );
  }
}
