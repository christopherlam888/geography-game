import 'package:flutter/material.dart';
import 'package:geography_game/pages/welcome.dart';
import 'package:geography_game/pages/player.dart';
import 'package:geography_game/pages/rules.dart';
import 'package:geography_game/pages/settings.dart';
import 'package:geography_game/pages/about.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: {
        '/welcome' : (context) => Welcome(),
        '/player' : (context) => Player(),
        '/rules' : (context) => Rules(),
        '/settings' : (context) => Settings(),
        '/about' : (context) => About(),
      }
  ));
}
