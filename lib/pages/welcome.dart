import 'package:flutter/material.dart';
import 'navbar.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:geography_game/variables.dart';
import 'package:geography_game/mystery_data.dart';

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
    generateLists();
    generateLocationsList();
  }

  void generateLists() {
    offNames = [];
    colNames = [];
    capNames = [];
    for (var i = 0; i < nameList1.length; i++) {
      if (nameList1[i]["offName"].isNotEmpty) {
        offNames.add(nameList1[i]["offName"].toLowerCase());
      }
    }
    for(var i = 0; i < nameList2.length; i++){
      if (nameList2[i]["name"].isNotEmpty) {
        colNames.add(nameList2[i]["name"].toLowerCase());
      }
      if (nameList2[i]["capital"].isNotEmpty) {
        capNames.add(nameList2[i]["capital"].toLowerCase());
      }
    }
  }

  void addList(bool category, List<String> categoryNames) {
    if (category) {
      for (var i = 0; i < categoryNames.length; i++){
        if (!locations.contains(categoryNames[i])) {
          locations.add(categoryNames[i]);
        }
      }
    }
  }

  void generateLocationsList() {
    locations = [];
    addList(capitals, capNames);
    addList(continents, continentsNames);
    if (countries) {
      addList(colloquial, colNames);
      addList(official, offNames);
    }
    addList(canada, canadaNames);
    addList(waterloo, waterlooNames);
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 80.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "WELCOME!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/globe-spinning.gif'),
                        width: 600.0,
                        height: 400.0,
                      ),
                      Opacity(
                        opacity: 1.0,
                        child: TextButton(
                          onPressed: () {},
                          onLongPress: () {
                            Navigator.pushNamed(context, '/mystery');
                          },
                          child: const Text(""),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 240,
                        child: ElevatedButton(
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
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
