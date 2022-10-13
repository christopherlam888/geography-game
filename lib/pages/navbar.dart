import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.orange[200],
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.book, color: Colors.black),
            title: const Text(
              "Rules",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {Navigator.pushNamed(context, '/rules');},
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.black),
            title: const Text(
              "Settings",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {Navigator.pushNamed(context, '/settings');},
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.black),
            title: const Text(
              "About",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {Navigator.pushNamed(context, '/about');},
          ),
        ],
      ),
    );
  }
}
