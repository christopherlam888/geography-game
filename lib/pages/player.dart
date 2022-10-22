import 'package:flutter/material.dart';
import 'dart:math';
import 'package:geography_game/variables.dart';
import 'package:geography_game/functions.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

  List<String> playerMoves = [];
  List<String> playerMovesDisplay = [];
  int player = 1;
  int turnCount = 1;

  String errorMessage = "";

  bool pendingWin = false;

  final scrollController = ScrollController();
  final nameGetter = TextEditingController();

  void clear(){
    nameGetter.clear();
  }
  @override
  void dispose(){
    nameGetter.dispose();
    super.dispose();
  }

  String generateRandomMove() {
    var random = Random();
    bool correct = false;
    int index = 0;
    String firstLetter = "";
    List<String> generatedRandomMoves = [];
    while (generatedRandomMoves.length != locations.length) {
      index = random.nextInt(locations.length);
      firstLetter = locations[index].substring(0,1);
      if (!generatedRandomMoves.contains(locations[index])) {
        generatedRandomMoves.add(locations[index]);
        if (!playerMoves.contains(locations[index]) && playerMoves[playerMoves.length-1].endsWith(firstLetter)) {
          correct = true;
          break;
        }
      }
    }
    if (correct == true) {
      return locations[index];
    }
    else {
      setWin(playerMoves[playerMoves.length-1]);
      return "No more locations";
    }
  }

  void generateDisplay() {
    playerMovesDisplay = [];
    if (playerMoves.length.isOdd) {
      playerMoves.add("...");
    }
    for (var i = playerMoves.length-1; i > 0; i-=2) {
      playerMovesDisplay.add(playerMoves[i-1]);
      playerMovesDisplay.add(playerMoves[i]);
    }
    if (playerMoves.length.isEven) {
      playerMoves.remove("...");
    }
  }

  void setWin(String move){
    playerMovesResults = playerMoves;
    playerMovesDisplayResults = playerMovesDisplay;
    playerResult = player;
    turnCountResult = turnCount;
    lastMove = toProperCase(move);
    Navigator.pop(context);
    Navigator.pushNamed(context, '/win');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Player"),
      ),
      body: Container(
        color: Colors.orange[200],
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Column(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                      child: Text(
                        "Player $player",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: player.isOdd ? Colors.red[400] : Colors.blue[400],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Turn #$turnCount",
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 240,
                        child: TextField(
                          controller: nameGetter,
                          decoration: const InputDecoration(
                            hintText: "Enter a location",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepOrange,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepOrange,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 240,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (mode == gamemode.two_player) {
                                    String move = nameGetter.text.toString().trim().toLowerCase();
                                    if (locations.contains(move)){
                                      if (!playerMoves.contains(move)) {
                                        String firstLetter = move.substring(0,1);
                                        if ((player == 1) && (playerMoves.isEmpty || playerMoves[playerMoves.length-1].endsWith(firstLetter))) {
                                          errorMessage = "";
                                          if (pendingWin) {
                                            turnCount++;
                                            setWin(move);

                                          }
                                          else {
                                            playerMoves.add(move);
                                            generateDisplay();
                                            player = 2;
                                          }
                                        }
                                        else if (playerMoves[playerMoves.length-1].endsWith(firstLetter)){
                                          errorMessage = "";
                                          if (pendingWin) {
                                            setWin(move);
                                          }
                                          else {
                                            playerMoves.add(move);
                                            generateDisplay();
                                            turnCount++;
                                            player = 1;
                                          }
                                        }
                                        else {
                                          errorMessage = "Incorrect First Letter!";
                                        }
                                      }
                                      else {
                                        errorMessage = "Already played!";
                                      }
                                    }
                                    else {
                                      errorMessage = "Not a valid location!";
                                    }
                                    nameGetter.clear();
                                  }
                                  else {
                                    if (player == 1) {
                                      String move = nameGetter.text.toString().trim().toLowerCase();
                                      if (locations.contains(move)) {
                                        if (!playerMoves.contains(move)) {
                                          String firstLetter = move.substring(0,1);
                                          if (playerMoves.isEmpty || playerMoves[playerMoves.length-1].endsWith(firstLetter)) {
                                            errorMessage = "";
                                            if (pendingWin) {
                                              turnCount++;
                                              setWin(move);

                                            }
                                            else {
                                              playerMoves.add(move);
                                              playerMoves.add(generateRandomMove());
                                              generateDisplay();
                                              turnCount++;
                                            }
                                          }
                                          else {
                                            errorMessage = "Incorrect first letter!";
                                          }
                                        }
                                        else {
                                          errorMessage = "Already played!";
                                        }
                                      }
                                      else {
                                        errorMessage = "Not a valid location!";
                                      }
                                      nameGetter.clear();
                                    }
                                  }
                               });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.amber[900],
                                side: const BorderSide(color: Colors.deepOrange, width: 4),
                            ),
                              child: const Text(
                                "Go!",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (mode == gamemode.two_player) {
                                  if (pendingWin == false) {
                                    if (playerMoves.isEmpty) {
                                      errorMessage = "Enter any location!";
                                      nameGetter.clear();
                                    }
                                    else if (player == 1) {
                                      player = 2;
                                      nameGetter.clear();
                                      pendingWin = true;
                                    }
                                    else {
                                      player = 1;
                                      nameGetter.clear();
                                      pendingWin = true;
                                    }
                                  }
                                  else {
                                    nameGetter.clear();
                                    playerMovesResults = playerMoves;
                                    playerMovesDisplayResults = playerMovesDisplay;
                                    turnCountResult = turnCount;
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, '/tie');
                                  }
                                }
                                else {
                                  if (playerMoves.isEmpty) {
                                    errorMessage = "Enter any location!";
                                    nameGetter.clear();
                                  }
                                  else {
                                    nameGetter.clear();
                                    playerMovesResults = playerMoves;
                                    playerMovesDisplayResults = playerMovesDisplay;
                                    turnCountResult = turnCount;
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, '/end');
                                  }
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                            child: const Text(
                              "Give Up",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      errorMessage,
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Text(
                        "Moves Played",
                        style: TextStyle(
                          fontSize: 20.0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 330,
                      width: 240,
                      child: Scrollbar(
                        thumbVisibility: true,
                        controller: scrollController,
                        radius: const Radius.circular(2.5),
                        thickness: 5.0,
                        child: CustomScrollView(
                          controller: scrollController,
                          slivers: <Widget> [
                            SliverGrid(
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 120,
                                mainAxisSpacing: 1.5,
                                crossAxisSpacing: 1.5,
                                childAspectRatio: 3.0,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return Container(
                                      alignment: Alignment.center,
                                      color: index.isEven ? Colors.red[400] : Colors.blue[400],
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            toProperCase(playerMovesDisplay[index]),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                childCount: playerMovesDisplay.length,
                              ),
                            ),
                          ],
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
