// Replace the code in main.dart with the following.

import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';
import 'player.dart';

void main() {
  runApp(new SpotifyApp());
}

class SpotifyApp extends StatefulWidget {
  @override
  SpotifyAppState createState() => new SpotifyAppState();
}

class SpotifyAppState extends State<SpotifyApp> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData.dark(),
      title: "Spotify",
      home: new HomeScreen(),
      routes: <String, WidgetBuilder>{
        '/player': (BuildContext context) => new PlayerScreen()
      }
    );
  }
}

