import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool countries = true;
  bool capitals = true;
  bool continents = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: const Text("Settings"),
      ),
      body: Container(
        color: Colors.orange[200],
        child: const Text("Settings"),
      ),
    );
  }
}
