import 'package:flutter/cupertino.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';

class Country extends StatefulWidget {
  Country({@required this.name, @required this.flagImg, this.isEditable});

  final String name;
  final String flagImg;
  final bool isEditable;

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
              Text(widget.name,
                  style: TextStyle(height: 1.5, fontWeight: FontWeight.w500)),
              Image.network(widget.flagImg),
              widget.isEditable
                  ? CustomNumberPicker(
                      initialValue: 0,
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
