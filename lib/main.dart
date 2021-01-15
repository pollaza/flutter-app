import 'package:flutter/cupertino.dart';
import 'package:pollaza/profile.dart';
import 'rankings.dart';
import 'matches.dart';
import 'bet.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        title: 'Pollaza',
        home: CupertinoTabScaffold(
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
                return SafeArea(child: Container(child: Rankings(phase: 2)));
                break;
              case 1:
                return SafeArea(child: Container(child: Matches(phase: 2)));
                break;
              case 2:
                return SafeArea(child: Container(child: Bet(phase: 2)));
                break;
              case 3:
                return SafeArea(child: Container(child: Profile()));
                break;
              default:
                return SafeArea(
                  child: Text('LOL'),
                );
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
