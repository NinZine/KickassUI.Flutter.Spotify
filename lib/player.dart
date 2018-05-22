import 'package:flutter/material.dart';
import 'dart:ui';
import 'album.dart';

class PlayerScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new PlayerScreenState();
  }
}

class PlayerScreenState extends State<PlayerScreen> {
  
  @override
  Widget build(BuildContext context) {
    Widget header = PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 8.0),
            child: IconButton(icon: const Icon(Icons.arrow_drop_down), onPressed: () {
                Navigator.pop(context);
            }),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  Text("PLAYING FROM ALBUM", style: new TextStyle(color: Colors.grey[400], fontFamily: "CircularSpotifyTxT", fontSize: 10.0, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("Death Magnetic", style: new TextStyle(color: Colors.grey[400], fontFamily: "CircularSpotifyTxT", fontSize: 12.0, fontWeight: FontWeight.bold),),
                  )
                ]
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 16.0, 8.0),
            child: const Icon(Icons.playlist_play),
          ),
        ]
      )
    );

    Widget body = Column(children: <Widget>[
      Align(
        heightFactor: 1.5,
        child: Container(

            child: Album(
              url: "http://vignette2.wikia.nocookie.net/metallica/images/e/ea/Death_Magnetic_%28album%29.jpg/revision/latest?cb=20160915153513",
              title: "Metallica",
              description: "Broken Beat & Scarred",
              size: 250.0,
              fontScale: 1.2
            )
      ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0.0),
            child: Text("3:25", style: new TextStyle(color: Colors.grey[400], fontFamily: "CircularSpotifyTxT", fontSize: 11.0, fontWeight: FontWeight.bold),),
          ),
          Expanded(child: Container(
            height: 4.0,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 2.0,
                  color: Colors.grey[700],
                ),
                Container(
                  height: 2.0,
                  width: 50.0,
                  color: Colors.white,
                ),
              ]
            )

          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0.0),
            child: Text("4:10", style: new TextStyle(color: Colors.grey[400], fontFamily: "CircularSpotifyTxT", fontSize: 11.0, fontWeight: FontWeight.bold),),
          )
        ]
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
              Expanded(child: const Icon(Icons.shuffle, color: const Color.fromRGBO(29, 185, 84, 1.0))),
              Expanded(child: const Icon(Icons.skip_previous)),
              Expanded(child: const Icon(Icons.pause_circle_outline, size: 72.0)),
              Expanded(child: const Icon(Icons.skip_next)),
              Expanded(child: const Icon(Icons.repeat)),
        ]
      )
    ]);

    Widget content = Column(
      children: <Widget>[
        header,
        body
      ]
    );

    Widget container = Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Align(
              heightFactor: 1.5,
              child: Image.network("http://vignette2.wikia.nocookie.net/metallica/images/e/ea/Death_Magnetic_%28album%29.jpg/revision/latest?cb=20160915153513", color: Colors.grey[600], colorBlendMode: BlendMode.darken),  // the image you want blurred
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
              child: content
            ),
          ]
    );
    Scaffold scaffold = new Scaffold(
      backgroundColor: Colors.grey[900],
      body: new ListView(
        children: [
          container
        ]
      )
    );

    return scaffold;
  }
}