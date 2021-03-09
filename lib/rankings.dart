import 'package:flutter/cupertino.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:ots/ots.dart';
import 'api_provider.dart';
import 'drawer.dart';
import 'globals.dart';
import 'dart:developer';

class Rankings extends StatefulWidget {
  Rankings({@required this.phase});

  final int phase;

  @override
  _RankingsState createState() => _RankingsState();
}

class _RankingsState extends State<Rankings> with AfterLayoutMixin<Rankings> {
  var positions = [];

  @override
  void afterFirstLayout(BuildContext context) {
    showLoader(isModal: true);
    ApiProvider().getRanking().then((ranking) => setState(() {
          print(positions);
          positions = ranking['scores'];
        }));
  }

  @override
  Widget build(BuildContext context) {
    int count = 1;
    var data = positions.map((user) => {
          'name': user['user']['fullName'],
          'photo': user['user']['photo'] != null
              ? "http:" +
                  user['user']['photo']["fields"]["file"]["url"].toString()
              : Globals.defaultAvatar,
          'res': user['winner'].toString(),
          'mar': user['score'].toString(),
          'puntos': user['total'].toString()
        });
    inspect(positions);

    List<TableRow> rows = [
      TableRow(children: [
        Text(" "),
        Text(" "),
        Text("Nombre",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("R", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("M", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Pts", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
      ])
    ];
    for (var result in data) {
      rows.add(TableRow(children: [
        Text((count++).toString()),
        new Container(
            width: 30.0,
            height: 30.0,
            padding: EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: new NetworkImage(result["photo"])))),
        Text(result["name"]),
        new Text(result["res"]),
        new Text(result["mar"]),
        new Text(result["puntos"])
      ]));
    }
    hideLoader();
    return new Scaffold(
        drawer: new MyDrawer(),
        appBar: AppBar(title: Text("Posiciones")),
        body: new Container(
            margin: EdgeInsets.all(14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Fase " + widget.phase.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: rows,
                    border: TableBorder(
                        horizontalInside: BorderSide(
                            width: 1,
                            color: CupertinoColors.lightBackgroundGray,
                            style: BorderStyle.solid)),
                    columnWidths: Map.from({
                      0: FractionColumnWidth(0.05),
                      1: FractionColumnWidth(0.1),
                      2: FractionColumnWidth(0.55),
                      3: FractionColumnWidth(0.1),
                      4: FractionColumnWidth(0.1),
                      5: FractionColumnWidth(0.1)
                    }),
                  ),
                ),
              ],
            )));
  }
}
