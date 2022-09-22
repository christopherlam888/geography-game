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
        title: const Text("Player"),
      ),
      body: Container(
        child: Column(
          children: [
            const Text("Player"),
            const Text("Turn: "),
            TextField(),
            TextButton(
                onPressed: () {},
                child: const Text("Go!")
            ),
          ],
        ),
      ),
    );
  }
}
