import 'package:flutter/cupertino.dart';
import 'package:pollaza/api_provider.dart';
import 'match.dart';

class Matches extends StatefulWidget {
  Matches({@required this.phase});
  final int phase;

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  Widget build(BuildContext context) {

    ApiProvider().getScores().then((value) => {
              print("response")
    });

    return Container(
        margin: EdgeInsets.all(14),
        child: Column(
          children: [
            Text(
              "Resultados - "+this.widget.phase.toString(),
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
              showOtherBets: true,
              isEditable: false,
            ),
            Positions()
          ],
        ));
  }
}

class Positions extends StatefulWidget {
  @override
  _PositionsState createState() => _PositionsState();
}

class _PositionsState extends State<Positions> {
  

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}


