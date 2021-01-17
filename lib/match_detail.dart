import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        Text("Nombre",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Marcador",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
      ])
    ];
    for (var result in data) {
      rows.add(TableRow(children: [
        Text(result["name"]),
        new Text(result["team1Score"] + ":" + result["team2Score"])
      ]));
    }
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          title: Text("Details"),
        ),
        body: new Container(
            margin: EdgeInsets.only(top: 14),
            child: Table(
              children: rows,
              border: TableBorder(
                  horizontalInside: BorderSide(
                      width: 1, color: Colors.blue, style: BorderStyle.solid)),
              //columnWidths: Map.from(
              //  {0: FixedColumnWidth(150), 1: FixedColumnWidth(150)}),
            )));
  }
}
