import 'package:flutter/material.dart';
import 'welcome.dart';
import 'settings.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  List<String> continentsNames = ["asia", "europe", "north america", "oceania", "antarctica", "south america", "africa"];
  List<String> locations = [];
  List<String> playerMoves = [];
  int player = 1;
  int turnCount = 1;
  String errorMessage = "";

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

  String toProperCase(String location) {
    List<String> joiners = [" ", "-"];
    for (var i = 0; i < joiners.length; i++) {
      location = location.split(joiners[i]).map((word) => word[0].toUpperCase() + word.substring(1)).join(joiners[i]);
    }
    return location;
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
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
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Player $player",
                        style: TextStyle(
                          fontSize: 35.0,
                          color: player.isOdd ? Colors.red[400] : Colors.blue[400],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Text(
                      "Turn: $turnCount",
                      style: const TextStyle(
                        fontSize: 30.0,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 240,
                        child: TextField(
                          controller: nameGetter,
                          decoration: const InputDecoration(
                            hintText: "Enter a location",
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

                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            String move = nameGetter.text.toString().trim().toLowerCase();
                            if (locations.contains(move) && !playerMoves.contains(move)){
                              String firstLetter = move.substring(0,1);
                                if ((player == 1) && (playerMoves.isEmpty || playerMoves[playerMoves.length-1].endsWith(firstLetter))) {
                                  playerMoves.add(move);
                                  player = 2;
                                  errorMessage = "";
                                }
                                else if (playerMoves[playerMoves.length-1].endsWith(firstLetter)){
                                  playerMoves.add(move);
                                  turnCount++;
                                  player = 1;
                                  errorMessage = "";
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
                            fontSize: 24.0,
                          ),
                        ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      errorMessage,
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.red,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(top: 25.0, bottom: 25.0),
                      child: Text(
                        "Moves Played:",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 340,
                      width: 180,
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
                                maxCrossAxisExtent: 90,
                                mainAxisSpacing: 1.5,
                                crossAxisSpacing: 1.5,
                                childAspectRatio: 2.0,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return Container(
                                      alignment: Alignment.center,
                                      color: index.isEven ? Colors.red[400] : Colors.blue[400],
                                      child: Text(
                                        toProperCase(playerMoves[index]),
                                        textAlign: TextAlign.center,
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
