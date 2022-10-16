import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}


class _PlayerState extends State<Player> {

  bool playerOne = true;
  List<String> playerMoves = [];

  int turnCount = 0;
  int slotCount = 0;

  final _firstController = ScrollController();
  final name_getter = TextEditingController();
  @override
  void clear(){
    name_getter.clear();
  }
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
                  child: TextField(
                    controller: name_getter,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (playerOne) {
                            playerMoves.add(name_getter.text.toString());
                            turnCount++;
                            playerOne = false;
                          }
                          else {
                            playerMoves.add(name_getter.text.toString());
                            playerOne = true;
                          }
                          slotCount++;
                          name_getter.clear();
                        });
                      },
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
                  padding: const EdgeInsets.only(top: 80.0, bottom: 25.0),
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
                            childAspectRatio: 2.0
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
      ),
    );
  }
}
