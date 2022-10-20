import 'package:flutter/material.dart';
import 'welcome.dart';
import 'package:geography_game/variables.dart';
import 'package:geography_game/functions.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

  List<String> locations = [];

  List<String> playerMoves = [];
  int player = 1;
  int turnCount = 1;

  String errorMessage = "";

  bool pendingWin = false;

  final scrollController = ScrollController();
  final nameGetter = TextEditingController();

  void generateLocationsList() {
    if (capitals) {
      locations.addAll(capNames);
    }
    if (continents) {
      locations.addAll(continentsNames);
    }
    if (countries) {
      if (colloquial) {
        locations.addAll(colNames);
      }
      // if (abbrev) {
      //
      // }
      if (official) {
        locations.addAll(offNames);
      }
    }
  }

  void clear(){
    nameGetter.clear();
  }
  @override
  void dispose(){
    nameGetter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    for (var i = 0; i < nameList1.length; i++) {
      offNames.add(nameList1[i]["offName"].toLowerCase());
    }

    for(var i = 0; i < nameList2.length; i++){
      colNames.add(nameList2[i]["name"].toLowerCase());
      capNames.add(nameList2[i]["capital"].toLowerCase());
    }

    generateLocationsList();

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
                                  String move = nameGetter.text.toString().trim().toLowerCase();
                                  if (locations.contains(move) && !playerMoves.contains(move)){
                                    String firstLetter = move.substring(0,1);
                                      if ((player == 1) && (playerMoves.isEmpty || playerMoves[playerMoves.length-1].endsWith(firstLetter))) {
                                        errorMessage = "";
                                        if (pendingWin) {
                                          turnCount++;
                                          playerMovesResults = playerMoves;
                                          playerResult = player;
                                          turnCountResult = turnCount;
                                          lastMove = toProperCase(move);
                                          Navigator.pop(context);
                                          Navigator.pushNamed(context, '/win');
                                        }
                                        else {
                                          playerMoves.add(move);
                                          player = 2;
                                        }
                                      }
                                      else if (playerMoves[playerMoves.length-1].endsWith(firstLetter)){
                                        errorMessage = "";
                                        if (pendingWin) {
                                          playerMovesResults = playerMoves;
                                          playerResult = player;
                                          turnCountResult = turnCount;
                                          lastMove = toProperCase(move);
                                          Navigator.pop(context);
                                          Navigator.pushNamed(context, '/win');
                                        }
                                        else {
                                          playerMoves.add(move);
                                          turnCount++;
                                          player = 1;
                                        }
                                      }
                                      else {
                                        errorMessage = "Try Again!";
                                      }
                                  }
                                  else{
                                    errorMessage = "Try Again!";
                                  }
                                  nameGetter.clear();
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
                                if (pendingWin == false) {
                                  if (playerMoves.isEmpty) {
                                    errorMessage = "Enter any location!";
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
                                  turnCountResult = turnCount;
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, '/tie');
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
                                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 5.0),
                                          child: Text(
                                            toProperCase(playerMoves[index]),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                childCount: playerMoves.length,
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
