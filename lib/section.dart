import 'package:flutter/material.dart';


class Section extends StatelessWidget {
  Section({this.title, this.description, this.children});

  final String title;
  final String description;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 10.0),
            child: new Column(
                children: description == null ? <Widget>[
                  new Text(title, style: new TextStyle(fontFamily: "CircularSpotifyTxT", fontSize: 18.0, fontWeight: FontWeight.bold),),
                ] :
                <Widget>[
                  new Text(title, style: new TextStyle(fontFamily: "CircularSpotifyTxT", fontSize: 18.0, fontWeight: FontWeight.bold),),
                  new Text(description, style: new TextStyle(fontFamily: "CircularSpotifyTxT", color: new Color(0xffcccccc)),)
                ],
            )
          ),

          new Container(
            height: 220.0,
            child: new ListView(
              scrollDirection: Axis.horizontal,
              children: children
            )
          )
        ],
      )
    );

  }
}