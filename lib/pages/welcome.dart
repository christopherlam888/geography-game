import 'package:flutter/material.dart';
import 'navbar.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geography Game"),
      ),
      drawer: NavBar(),
      body: Container(
        child: Column(
          children: [
            const Text("Welcome"),
            TextButton(
                onPressed: () {Navigator.pushNamed(context, '/player');},
                child: const Text("Start Game")
            ),
          ],
        ),
      ),
    );
  }
}
