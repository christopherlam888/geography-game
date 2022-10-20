import 'package:flutter/material.dart';
import 'navbar.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:geography_game/variables.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  Future<void> readJson() async {
    String response = await rootBundle.loadString('assets/Official.json');
    final data1 = await json.decode(response);
    setState(() {
      nameList1 = data1["Official"];
    });

    response = await rootBundle.loadString('assets/Capitals_Countries.json');
    final data2 = await json.decode(response);
    setState((){
      nameList2 = data2["Col_Cap"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Geography Game"),
      ),
      drawer: const NavBar(),
      body: Container(
        color: Colors.orange[200],
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "WELCOME!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const Image(
                  image: AssetImage('assets/globe-spinning.gif'),
                  width: 600.0,
                  height: 400.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        readJson();
                        Navigator.pushNamed(context, '/player');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber[900],
                        side: const BorderSide(color: Colors.deepOrange, width: 4),
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
          ],
        ),
      ),
    );
  }
}
