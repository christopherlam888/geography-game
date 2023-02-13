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
  String lastLetter = "*";
  String randomLetter = "*";
  List<String> playerMovesDisplay = [];
  int player = 1;
  int turnCount = 1;

  String errorMessage = "";

  bool pendingWin = false;

  bool singleplayerWin = false;

  final scrollController = ScrollController();
  final nameGetter = TextEditingController();

  void clear() {
    nameGetter.clear();
  }

  @override
  void dispose() {
    nameGetter.dispose();
    super.dispose();
  }

  void generateRandomLetter() {
    var random = Random();
    int index = 0;
    String firstLetter = "";
    List<String> generatedRandomMoves = [];
    bool movesLeft = false;
    randomLetter = "-";
    while (generatedRandomMoves.length != locations.length) {
      index = random.nextInt(locations.length);
      firstLetter = locations[index].substring(0, 1);
      if (!generatedRandomMoves.contains(locations[index])) {
        generatedRandomMoves.add(locations[index]);
        if (!playerMoves.contains(locations[index])) {
          movesLeft = true;
          if (!playerMoves[playerMoves.length - 1].endsWith(firstLetter)) {
            randomLetter = firstLetter;
            return;
          }
        }
      }
    }
    if (!movesLeft) {
      if (mode == gamemode.two_player) {
        setTie();
      } else {
        String singleplayerLastMove = playerMoves[playerMoves.length - 1];
        if (playerMoves.length.isEven) {
          playerMoves.removeLast();
        }
        singleplayerWin = true;
        setWin(singleplayerLastMove);
      }
    }
  }

  String generateRandomMove() {
    var random = Random();
    int index = 0;
    String firstLetter = "";
    List<String> generatedRandomMoves = [];
    while (generatedRandomMoves.length != locations.length) {
      index = random.nextInt(locations.length);
      firstLetter = locations[index].substring(0, 1);
      if (!generatedRandomMoves.contains(locations[index])) {
        generatedRandomMoves.add(locations[index]);
        if (!playerMoves.contains(locations[index]) &&
            (playerMoves[playerMoves.length - 1].endsWith(firstLetter) ||
                firstLetter == randomLetter)) {
          break;
        }
      }
    }
    return locations[index];
  }

  void generateDisplay() {
    playerMovesDisplay = [];
    if (playerMoves.length.isOdd) {
      playerMoves.add("...");
    }
    for (var i = playerMoves.length - 1; i > 0; i -= 2) {
      playerMovesDisplay.add(playerMoves[i - 1]);
      playerMovesDisplay.add(playerMoves[i]);
    }
    if (playerMoves.length.isEven) {
      playerMoves.remove("...");
    }
  }

  void setWin(String move) {
    playerMovesResults = playerMoves;
    playerMovesDisplayResults = playerMovesDisplay;
    playerResult = player;
    turnCountResult = turnCount;
    lastMove = toProperCase(move);
    Navigator.pop(context);
    Navigator.pushNamed(context, '/win');
  }

  void setTie() {
    playerMovesResults = playerMoves;
    playerMovesDisplayResults = playerMovesDisplay;
    turnCountResult = turnCount;
    Navigator.pop(context);
    Navigator.pushNamed(context, '/tie');
  }

  void setEnd() {
    playerMovesResults = playerMoves;
    playerMovesDisplayResults = playerMovesDisplay;
    turnCountResult = turnCount;
    Navigator.pop(context);
    Navigator.pushNamed(context, '/end');
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Are you sure?"),
          content: const Text("This action cannot be undone"),
          backgroundColor: Colors.orange[200],
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: const Text(
                "No",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                  if (mode == gamemode.two_player) {
                    if (pendingWin == false) {
                      nameGetter.clear();
                      pendingWin = true;
                      if (player == 1) {
                        player = 2;
                      } else {
                        player = 1;
                      }
                    } else {
                      setTie();
                    }
                  } else {
                    setEnd();
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: const Text(
                "Yes",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
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
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                      child: Text(
                        "Player $player",
                        style: TextStyle(
                          fontSize: 30.0,
                          color:
                              player.isOdd ? Colors.red[400] : Colors.blue[400],
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
                    const SizedBox(
                      height: 5.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Last Letter: ",
                        children: [
                          TextSpan(
                            text: lastLetter,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Random Letter: ",
                        children: [
                          TextSpan(
                            text: randomLetter.toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
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
                                  if (pendingWin == false) {
                                    if (playerMoves.isEmpty) {
                                      errorMessage = "Enter any location!";
                                      nameGetter.clear();
                                    } else if (player == 1) {
                                      _showDialog();
                                    } else {
                                      _showDialog();
                                    }
                                  } else {
                                    nameGetter.clear();
                                    _showDialog();
                                  }
                                } else {
                                  if (playerMoves.isEmpty) {
                                    errorMessage = "Enter any location!";
                                    nameGetter.clear();
                                  } else {
                                    nameGetter.clear();
                                    _showDialog();
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
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                String move = nameGetter.text
                                    .toString()
                                    .trim()
                                    .toLowerCase();
                                if (locations.contains(move)) {
                                  if (!playerMoves.contains(move)) {
                                    String firstLetter = move.substring(0, 1);
                                    if (mode == gamemode.two_player) {
                                      if ((player == 1) &&
                                          (playerMoves.isEmpty ||
                                              playerMoves[
                                                      playerMoves.length - 1]
                                                  .endsWith(firstLetter) ||
                                              firstLetter == randomLetter)) {
                                        errorMessage = "";
                                        if (pendingWin) {
                                          turnCount++;
                                          setWin(move);
                                        } else {
                                          playerMoves.add(move);
                                          lastLetter = playerMoves[
                                                  playerMoves.length - 1]
                                              .substring(playerMoves[
                                                          playerMoves.length -
                                                              1]
                                                      .length -
                                                  1)
                                              .toUpperCase();
                                          generateDisplay();
                                          player = 2;
                                          generateRandomLetter();
                                        }
                                      } else if (playerMoves[
                                                  playerMoves.length - 1]
                                              .endsWith(firstLetter) ||
                                          firstLetter == randomLetter) {
                                        errorMessage = "";
                                        if (pendingWin) {
                                          setWin(move);
                                        } else {
                                          playerMoves.add(move);
                                          lastLetter = playerMoves[
                                                  playerMoves.length - 1]
                                              .substring(playerMoves[
                                                          playerMoves.length -
                                                              1]
                                                      .length -
                                                  1)
                                              .toUpperCase();
                                          generateDisplay();
                                          turnCount++;
                                          player = 1;
                                          generateRandomLetter();
                                        }
                                      } else {
                                        errorMessage =
                                            "Incorrect first letter!";
                                      }
                                    } else {
                                      if (playerMoves.isEmpty ||
                                          playerMoves[playerMoves.length - 1]
                                              .endsWith(firstLetter) ||
                                          firstLetter == randomLetter) {
                                        errorMessage = "";
                                        playerMoves.add(move);
                                        generateRandomLetter();
                                        playerMoves.add(generateRandomMove());
                                        if (!singleplayerWin) {
                                          lastLetter = playerMoves[
                                                  playerMoves.length - 1]
                                              .substring(playerMoves[
                                                          playerMoves.length -
                                                              1]
                                                      .length -
                                                  1)
                                              .toUpperCase();
                                          generateDisplay();
                                          turnCount++;
                                          generateRandomLetter();
                                        }
                                      } else {
                                        errorMessage =
                                            "Incorrect first letter!";
                                      }
                                    }
                                  } else {
                                    errorMessage = "Already played!";
                                  }
                                } else {
                                  errorMessage = "Not a valid location!";
                                }
                                nameGetter.clear();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber[900],
                              side: const BorderSide(
                                  color: Colors.deepOrange, width: 4),
                            ),
                            child: const Text(
                              "Go!",
                              style: TextStyle(
                                fontSize: 20.0,
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
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 340,
                      width: 260,
                      child: Scrollbar(
                        thumbVisibility: true,
                        controller: scrollController,
                        radius: const Radius.circular(2.5),
                        thickness: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 10.0),
                          child: CustomScrollView(
                            controller: scrollController,
                            slivers: <Widget>[
                              SliverGrid(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 118.5,
                                  mainAxisSpacing: 3.0,
                                  crossAxisSpacing: 3.0,
                                  childAspectRatio: 3.0,
                                ),
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0)),
                                        color: index.isEven
                                            ? Colors.red[400]
                                            : Colors.blue[400],
                                      ),
                                      alignment: Alignment.center,
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            toProperCase(
                                                playerMovesDisplay[index]),
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
