import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'match_info.dart';
import 'country.dart';

class Match extends StatelessWidget {
  Match(
      {@required this.host,
      @required this.guest,
      @required this.hostFlag,
      @required this.guestFlag,
      @required this.result,
      @required this.date,
      @required this.hour,
      this.showOtherBets,
      this.isEditable});

  final String host;
  final String guest;
  final String hostFlag;
  final String guestFlag;
  final String result;
  final String date;
  final String hour;
  final bool showOtherBets;
  final bool isEditable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: CupertinoColors.extraLightBackgroundGray,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Country(name: host, flagImg: hostFlag, isEditable: isEditable),
              isEditable
                  ? Text("vs")
                  : MatchInfo(result: result, date: date, hour: hour),
              Country(name: guest, flagImg: guestFlag, isEditable: isEditable),
              this.showOtherBets
                  ? Container(
                      child: Icon(
                        CupertinoIcons.chevron_forward,
                        size: 25.0,
                        color: Colors.blueGrey,
                      ),
                    )
                  : Container()
            ],
          ),
        ]),
      ),
      onTap: () {
        Navigator.of(context).pushNamed("detail");
      },
    );
  }
}

class FontAwesomeIcons {}

class OtherBets extends StatefulWidget {
  @override
  _BetsState createState() => _BetsState();
}

class _BetsState extends State<OtherBets> {
  bool isExpanded = false;

  toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      {'name': "German", 'team1': "1", 'team2': "1"},
      {'name': "Santi", 'team1': "0", 'team2': "0"},
      {'name': "Jose", 'team1': "1", 'team2': "2"}
    ];

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
        new Text(result["team1"] + ":" + result["team2"])
      ]));
    }

    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Column(
        children: [
          CupertinoButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${isExpanded ? 'Cerrar' : 'Mostrar'} apuestas'),
                  Icon(
                      isExpanded
                          ? CupertinoIcons.chevron_up
                          : CupertinoIcons.chevron_down,
                      size: 16)
                ],
              ),
              onPressed: toggle),
          Container(
            child: isExpanded
                ? Table(
                    children: rows,
                    border: TableBorder(
                        horizontalInside: BorderSide(
                            width: 1,
                            color: Colors.blue,
                            style: BorderStyle.solid)),
                    columnWidths: Map.from(
                        {0: FixedColumnWidth(150), 1: FixedColumnWidth(150)}),
                  )
                : null,
          )
        ],
      ),
    );
  }
}
