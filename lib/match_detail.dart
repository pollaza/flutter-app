import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchDetail extends StatefulWidget {
  @override
  _MatchDetailState createState() => _MatchDetailState();
}

class _MatchDetailState extends State<MatchDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          title: Text("Details"),
        ),
        body: new Text("Match Detail"));
  }
}
