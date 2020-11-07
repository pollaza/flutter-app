import 'package:flutter/cupertino.dart';
import 'matches.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        title: 'Pollaza',
        home: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Pollaza'),
            ),
            child: SafeArea(child: Container(child: Matches(phase: 2)))));
  }
}
