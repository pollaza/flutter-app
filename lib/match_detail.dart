import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globals.dart';

class MatchDetail extends StatelessWidget {
  MatchDetail({@required this.id, @required this.predictions});

  final List predictions;
  final String id;

  @override
  Widget build(BuildContext context) {
    var data = [];
    for (var prediction in predictions) {
      if (prediction["match"]["sys"]["id"].toString() == this.id) {
        inspect(prediction);
        var obj = {
          'name': prediction["user"]["fullName"].toString(),
          'photo': prediction['user']['photo'] != null
              ? "http:" +
                  prediction['user']['photo']["fields"]["file"]["url"]
                      .toString()
              : Globals.defaultAvatar,
          'team1Name': prediction["scoreTeam1"].toString(),
          'team1Score': prediction["scoreTeam1"].toString(),
          'team2Name': prediction["scoreTeam1"].toString(),
          'team2Score': prediction["scoreTeam2"].toString()
        };
        data.add(obj);
      }
    }
    inspect(data);

    List<TableRow> rows = [
      TableRow(children: [
        Text("   "),
        Text("Nombre",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Marcador",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
      ])
    ];
    for (var result in data) {
      rows.add(TableRow(children: [
        new Container(
            width: 30.0,
            height: 30.0,
            padding: EdgeInsets.all(0),
            margin: new EdgeInsets.symmetric(vertical: 10),
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: new NetworkImage(result["photo"])))),
        Text(result["name"]),
        new Text(result["team1Score"] + " - " + result["team2Score"])
      ]));
    }
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          title: Text("Detalle"),
        ),
        body: new Container(
            margin: EdgeInsets.only(top: 14),
            child: Table(
              children: rows,
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder(
                  horizontalInside: BorderSide(
                      width: 1,
                      color: CupertinoColors.lightBackgroundGray,
                      style: BorderStyle.solid)),
              columnWidths: Map.from({
                0: FractionColumnWidth(0.15),
                1: FractionColumnWidth(0.60),
                2: FractionColumnWidth(0.25)
              }),
            )));
  }
}
