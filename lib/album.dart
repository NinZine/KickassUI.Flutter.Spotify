import 'package:flutter/material.dart';

class Album extends StatelessWidget {
  Album({this.url, this.title, this.description, this.size=150.0, this.fontScale=1.0});

  final String url;
  final String title;
  final String description;
  final double size;
  final double fontScale;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
      width: this.size,
      child: new Column(
        children: <Widget>[
          new Image.network(url, width: this.size, height: this.size,),
          new Container(
            padding: EdgeInsets.fromLTRB(0.0, 8.0 * fontScale, 0.0, 5.0 * fontScale),
            child: new Text(title, style: new TextStyle(fontFamily: "CircularSpotifyTxT", fontSize: 13.0 * fontScale, fontWeight: FontWeight.bold),),
          ),
          new Text(description, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: new TextStyle(fontFamily: "CircularSpotifyTxT", fontSize: 12.0 * fontScale, color: new Color(0xffcccccc)),)
        ]
      )
    );
  }
}