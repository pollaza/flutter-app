import 'package:flutter/cupertino.dart';

import 'country.dart';

class MatchInfo extends StatelessWidget {
  MatchInfo({@required this.result, @required this.date, @required this.hour});

  final String result;
  final String date;
  final String hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      child: Column(
        children: [
          Container(
              child: Text(
                result,
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
          Text(date, style: TextStyle(fontSize: 14, height: 1.6)),
          Text(hour, style: TextStyle(fontSize: 14, height: 1.6))
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
      this.showOtherBets});

  final String host;
  final String guest;
  final String hostFlag;
  final String guestFlag;
  final String result;
  final String date;
  final String hour;
  bool showOtherBets = false;

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
              Country(name: host, flagImg: hostFlag),
              MatchInfo(result: result, date: date, hour: hour),
              Country(name: guest, flagImg: guestFlag)
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
            child: isExpanded ? Text('expanded') : Text('collapsed'),
          )
        ],
      ),
    );
  }
}