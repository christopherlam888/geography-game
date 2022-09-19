import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.book),
            title: Text("Rules"),
            onTap: () {Navigator.pushNamed(context, '/rules');},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {Navigator.pushNamed(context, '/settings');},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About"),
            onTap: () {Navigator.pushNamed(context, '/about');},
          ),
        ],
      ),
    );
  }
}
