import 'package:flutter/material.dart';
import 'pages/welcome.dart';
import 'pages/player.dart';
import 'pages/rules.dart';
import 'pages/settings.dart';
import 'pages/about.dart';
import 'pages/win.dart';
import 'pages/tie.dart';
import 'pages/end.dart';
import 'pages/mystery.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: {
        '/welcome' : (context) => const Welcome(),
        '/player' : (context) => const Player(),
        '/rules' : (context) => const Rules(),
        '/settings' : (context) => const Settings(),
        '/about' : (context) => const About(),
        '/win' : (context) => const Win(),
        '/tie' : (context) => const Tie(),
        '/end' : (context) => const End(),
        '/mystery' : (context) => const Mystery(),
      }
  ));
}
