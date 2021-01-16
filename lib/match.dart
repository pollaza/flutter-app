import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'country.dart';

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
          Container(
              child: Text(
                widget.result,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 4,
                    fontSize: 18),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              margin: EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.inactiveGray),
                  borderRadius: BorderRadius.all(Radius.circular(2)))),
          Text(widget.date, style: TextStyle(fontSize: 14, height: 1.6)),
          Text(widget.hour, style: TextStyle(fontSize: 14, height: 1.6))
        ],
      ),
    );
  }
}

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
    
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Country(name: host, flagImg: hostFlag, isEditable: isEditable),
              isEditable ? Text("vs") : MatchInfo(result: result, date: date, hour: hour),
              Country(name: guest, flagImg: guestFlag, isEditable: isEditable)
            ],
          ),
          this.showOtherBets ? OtherBets() : Container()
        ]),
      ),
    ]);
  }
}
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
      {'name': "German", 'team1': "1",'team2': "1"},
      {'name': "Santi", 'team1': "0",'team2': "0"},
      {'name': "Jose", 'team1': "1",'team2': "2"}
    ];

    List<TableRow> rows = [TableRow(children: [Text("Nombre",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),Text("Marcador",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))])];
    for (var result in data){
      rows.add(TableRow(children: [Text(result["name"]),new Text(result["team1"] +":"+result["team2"])]));
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
            child: isExpanded ? 
             Table(
                children: rows,
                border: TableBorder(horizontalInside: BorderSide(width: 1, color: Colors.blue, style: BorderStyle.solid)),
                columnWidths: Map.from({
                  0: FixedColumnWidth(150),
                  1: FixedColumnWidth(150)
                }),
                )
             : Text(''),
          )
        ],
      ),
    );
  }
}