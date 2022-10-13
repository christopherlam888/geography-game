import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool playerOne = true;
  List<String> playerOneMoves = [];
  List<String> playerTwoMoves = [];
  int playerOneTurn = 0;
  int playerTwoTurn = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: const Text("Player"),
      ),
      body: Container(
        color: Colors.orange[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Column(
              children:[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: const Text(
                    "Player",
                    style: TextStyle(
                      fontSize: 35.0,
                    ),
                  ),
                ),

                const Text(
                  "Turn: ",
                  style: TextStyle(
                    fontSize: 35.0,
                  ),
                ),

                SizedBox(
                  width: 240,
                  child: TextField(),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Go!",
                        style: TextStyle(
                          fontSize: 24.0
                        ),
                      ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber[900],
                      side: BorderSide(color: Colors.deepOrange, width: 4),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Text(
                    "Moves Played:",
                    style: TextStyle(
                      fontSize: 25.0,
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
