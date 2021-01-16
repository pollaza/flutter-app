import 'package:flutter/cupertino.dart';
import 'package:after_layout/after_layout.dart';
import 'api_provider.dart';

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
          'res': user['winner'].toString(),
          'mar': user['score'].toString(),
          'puntos': user['total'].toString()
        });

    print('data xd $data');

    // var data = [
    //   {'name': "German", 'res': "1", 'mar': "2", 'puntos': "3"},
    //   {'name': "Santi", 'res': "0", 'mar': "2", 'puntos': "2"},
    //   {'name': "Jose", 'res': "0", 'mar': "0", 'puntos': "1"}
    // ];

    List<TableRow> rows = [
      TableRow(children: [
        Text(" "),
        Text("Nombre",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("R", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("M", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Puntos",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
      ])
    ];
    for (var result in data) {
      rows.add(TableRow(children: [
        Text((count++).toString()),
        Text(result["name"]),
        new Text(result["res"]),
        new Text(result["mar"]),
        new Text(result["puntos"])
      ]));
    }

    return Container(
        margin: EdgeInsets.all(14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Posiciones - " + widget.phase.toString(),
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Table(
                children: rows,
                border: TableBorder(
                    horizontalInside: BorderSide(
                        width: 1,
                        color: CupertinoColors.activeBlue,
                        style: BorderStyle.solid)),
                columnWidths: Map.from({
                  0: FractionColumnWidth(0.1),
                  1: FractionColumnWidth(0.5),
                  2: FractionColumnWidth(0.1),
                  3: FractionColumnWidth(0.1),
                  4: FractionColumnWidth(0.2)
                }),
              ),
            ),
          ],
        ));
  }
}
