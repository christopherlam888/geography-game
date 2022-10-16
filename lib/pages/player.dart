import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}


class _PlayerState extends State<Player> {

  int player = 1;
  List<String> playerMoves = [];

  int turnCount = 1;
  int slotCount = 0;

  final _firstController = ScrollController();
  final name_getter = TextEditingController();

  void clear(){
    name_getter.clear();
  }
  @override
  void dispose(){
    name_getter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        style: const TextStyle(
                          fontSize: 35.0,
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
                          controller: name_getter,
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
                            if (player == 1) {
                              playerMoves.add(name_getter.text.toString());
                              player = 2;
                            }
                            else {
                              playerMoves.add(name_getter.text.toString());
                              turnCount++;
                              player = 1;
                            }
                            slotCount++;
                            name_getter.clear();
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

                    const Padding(
                      padding: EdgeInsets.only(top: 50.0, bottom: 25.0),
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
                        controller: _firstController,
                        radius: const Radius.circular(2.5),
                        thickness: 5.0,
                        child: CustomScrollView(
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
                                      color: Colors.orange[300],
                                      child: Text(playerMoves[index]),
                                    );
                                  },
                                childCount: slotCount,
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
