import 'package:flutter/cupertino.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';

class Country extends StatefulWidget {
  Country(
      {@required this.name,
      @required this.flagImg,
      @required this.isEditable,
      @required this.score});

  final String name;
  final String flagImg;
  final bool isEditable;
  final int score;

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("http:" + widget.flagImg),
              Text(widget.name,
                  style: TextStyle(height: 1.5, fontWeight: FontWeight.w500)),
              widget.isEditable
                  ? CustomNumberPicker(
                      initialValue: widget.score,
                      maxValue: 100,
                      minValue: 0,
                      step: 1,
                      onValue: (value) {
                        print(value.toString());
                      },
                    )
                  : Container()
            ]));
  }
}
