import 'package:flutter/cupertino.dart';

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