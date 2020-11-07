import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class Positions extends StatefulWidget {
  @override
  _PositionsState createState() => _PositionsState();
}

class _PositionsState extends State<Positions> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.title);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return Text('loading');
        },
      ),
    );
  }
}

class Bets extends StatefulWidget {
  @override
  _BetsState createState() => _BetsState();
}

class _BetsState extends State<Bets> {
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

class Country extends StatelessWidget {
  Country({@required this.name, @required this.flagImg});

  final String name;
  final String flagImg;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name,
                  style: TextStyle(height: 1.5, fontWeight: FontWeight.w500)),
              Image.network(flagImg)
            ]));
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
      @required this.hour});

  final String host;
  final String guest;
  final String hostFlag;
  final String guestFlag;
  final String result;
  final String date;
  final String hour;

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
          Bets()
        ]),
      ),
    ]);
  }
}

class Matches extends StatelessWidget {
  Matches({@required this.phase});

  final int phase;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(14),
        child: Column(
          children: [
            Text(
              'Eliminatorias Conmebol - Fase $phase',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            Match(
              host: 'Bolivia',
              guest: 'Argentina',
              hostFlag:
                  'http://ssl.gstatic.com/onebox/media/sports/logos/SGxeD7yhwPj53FmPBmMMHg_48x48.png',
              guestFlag:
                  'http://ssl.gstatic.com/onebox/media/sports/logos/1xBWyjjkA6vEWopPK3lIPA_48x48.png',
              date: '2020-10-13',
              hour: '15:00',
              result: '1:2',
            ),
            Positions()
          ],
        ));
  }
}
