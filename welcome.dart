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
        backgroundColor: Colors.orange[900],
        title: const Text("Geography Game"),
      ),
      drawer: NavBar(),
      body: Container(
        color: Colors.orange[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                    ),
                  ),
                ],
              ),
            ),
            Image(
              image: AssetImage('assets/globe-spinning3.gif'),
              width: 600.0,
              height: 400.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {Navigator.pushNamed(context, '/player');},

                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber[900],
                    side: BorderSide(color: Colors.deepOrange, width: 4),
                    elevation: 10,
                    shadowColor: Colors.amber,
                  ),

                    child: const Text(
                      "Start Game",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
