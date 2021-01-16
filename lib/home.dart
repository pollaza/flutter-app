import 'package:flutter/cupertino.dart';
import 'package:pollaza/profile.dart';
import 'rankings.dart';
import 'matches.dart';
import 'bet.dart';
import 'profile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_number),
            label: 'Posiciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bars),
            label: 'Resultados',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.pencil_circle),
            label: 'Apuestas',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle),
            label: 'Perfil',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return SafeArea(child: Rankings(phase: 2));
            break;
          case 1:
            return SafeArea(child: Matches(phase: 2));
            break;
          case 2:
            return SafeArea(child: Bet(phase: 2));
            break;
          case 3:
            return SafeArea(child: Profile());
            break;
          default:
            return null;
        }
      },
    ));
    // home: CupertinoPageScaffold(
    //     navigationBar: CupertinoNavigationBar(
    //       middle: Text('Pollaza'),
    //     ),
    //     child: SafeArea(child: Container(child: Matches(phase: 2)))));
  }
}
