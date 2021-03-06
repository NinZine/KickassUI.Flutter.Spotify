import 'dart:async';
import 'package:flutter/material.dart';

import 'album.dart';
import 'player_bar.dart';
import 'section.dart';

class HomeScreen extends StatefulWidget {

  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    const duration = const Duration(seconds: 3);
    Timer timer = new Timer(duration, () {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) {
      final ThemeData themeData = Theme.of(context);
      return new Container(
        decoration: new BoxDecoration(
          border: new Border(top: new BorderSide(color: themeData.disabledColor))
        ),
        child: new Padding(
          padding: const EdgeInsets.all(32.0),
          child: new Text('This is a Material persistent bottom sheet. Drag downwards to dismiss it.',
            textAlign: TextAlign.center,
            style: new TextStyle(
              color: themeData.accentColor,
              fontSize: 24.0
            )
          )
        )
      );
    })
    .closed.whenComplete(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget madeForYouSection = new Section(
      title: "Made For You",
      description: "Get better recommendations the more you listen.",
      children: <Widget>[
        new Album(
          url: "https://upload.wikimedia.org/wikipedia/en/0/02/Mezmerize-LP.jpg",
          title: "Daily Mix 1",
          description: "System Of A Down, Limp Bizkit, Metallica and Trivium"
        ),
        new Album(
          url: "https://pbs.twimg.com/profile_images/769220665878523905/I1ZHkR5S.jpg",
          title: "Daily Mix 2",
          description: "Jane 'N The Jungle, Sailmate, Mill's End, Chad Wilson Bailey"
        ),
        new Album(
          url: "https://i.scdn.co/image/a9cdead5cf5d85a33e7bc12b49d1006821650ca4",
          title: "Funk Rock",
          description: "Prince, Funkadelic, Red Hot Chili Peppers, George Clinton"
        ),
      ]
    );

    Widget jumpBackInSection = new Section(
      title: "Jump Back In",
      children: <Widget>[
        new Album(
          url: "https://upload.wikimedia.org/wikipedia/en/0/02/Mezmerize-LP.jpg",
          title: "Mezmerize",
          description: "System Of A Down"
        ),
        new Album(
          url: "https://resources.wimpmusic.com/images/98b38a51/23fd/405f/8b27/9fb2a5e38d84/1280x1280.jpg",
          title: "100% Scooter",
          description: "Scooter"
        ),
        new Album(
          url: "https://i.scdn.co/image/6c6086f6922b9a44920310b34ef98161bd7adf78",
          title: "Clint Eastwood",
          description: "Gorillaz",
        ),
      ]
    );

    BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      currentIndex: 0,
      fixedColor: Colors.white,

      // Always display text and do not shift when tapped. Otherwise
      // labels are hidden because >3 items defaults to BottomNavigationBarType.shift
      type: BottomNavigationBarType.fixed,

      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          title: new Text('Home', style: new TextStyle(fontFamily: "CircularSpotifyTxT", fontSize: 13.0)),
        ),
        new BottomNavigationBarItem(
          icon: const Icon(Icons.folder),
          title: new Text('Browse', style: new TextStyle(fontFamily: "CircularSpotifyTxT", fontSize: 13.0)),
        ),
        new BottomNavigationBarItem(
          icon: const Icon(Icons.search),
          title: new Text('Search', style: new TextStyle(fontFamily: "CircularSpotifyTxT", fontSize: 13.0)),
        ),
        new BottomNavigationBarItem(
          icon: const Icon(Icons.radio),
          title: new Text('Radio', style: new TextStyle(fontFamily: "CircularSpotifyTxT", fontSize: 13.0)),
        ),
        new BottomNavigationBarItem(
          icon: const Icon(Icons.library_books),
          title: new Text('Your Library', style: new TextStyle(fontFamily: "CircularSpotifyTxT", fontSize: 13.0)),
        )
      ]
    );

    Widget player = new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //new LinearProgressIndicator(value: 0.5, backgroundColor: Colors.grey[700],),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new IconButton(icon: const Icon(Icons.arrow_drop_up), onPressed: () { 
                Navigator.pushNamed(context, '/player');
              }),
              new Expanded(child:new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text("Broken, Beat & Scarred", style: new TextStyle(fontFamily: "CircularSpotifyTxT", fontSize: 11.0)),
                      new Text(" • ", style: new TextStyle(fontFamily: "CircularSpotifyTxT", fontSize: 11.0, color: const Color(0xffadaeb2))),
                      new Text("Metallica", style: new TextStyle(fontFamily: "CircularSpotifyTxT", fontSize: 11.0, color: const Color(0xffadaeb2)))
                    ]
                  )
                ]
              )),
              const Icon(Icons.play_arrow)
            ]
          )
        ]
      )
    );


    // Using nested Scaffolds because Spotify basically has two bottom bars, one
    // for the player and one for navigation through the app
    Scaffold scaffold = new Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[900],
      appBar: new PreferredSize(
        preferredSize: new Size.fromHeight(60.0),
        child: new Container(
              color: Colors.grey[850],
              padding: const EdgeInsets.fromLTRB(0.0, 48.0, 0.0, 0.0),
              child: new Column(children: <Widget>[
                new Text("Home", style: new TextStyle(fontFamily: "CircularSpotifyTxT", fontSize: 16.0, fontWeight: FontWeight.bold),),
              ])
            ),
      ),
      body: new ListView(
        children: [
          madeForYouSection,
          jumpBackInSection
        ]
      ),
      bottomNavigationBar: new PlayerBar(
        child: player,
        backgroundColor: Colors.grey[850]
      )
    );

    return new Scaffold(
      body: scaffold,
      bottomNavigationBar: bottomNavigationBar
    );
  }
}
