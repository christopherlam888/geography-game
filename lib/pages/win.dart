import 'package:flutter/material.dart';
import 'package:geography_game/variables.dart';
import 'package:geography_game/functions.dart';

class Win extends StatefulWidget {
  const Win({Key? key}) : super(key: key);

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {
  final winScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Congratulations!"),
      ),
      body: Container(
        color: Colors.orange[200],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
                      child: Text(
                        "You Win!",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Player $playerResult",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: playerResult.isOdd
                            ? Colors.red[400]
                            : Colors.blue[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "Turn #$turnCountResult",
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "Last Move: $lastMove",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: mode == gamemode.two_player
                            ? (playerResult.isOdd
                                ? Colors.red[400]
                                : Colors.blue[400])
                            : (playerMovesResults.length.isEven
                                ? Colors.red[400]
                                : Colors.blue[400]),
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
                      height: 340,
                      width: 260,
                      child: Scrollbar(
                        thumbVisibility: true,
                        controller: winScrollController,
                        radius: const Radius.circular(2.5),
                        thickness: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 10.0),
                          child: CustomScrollView(
                            controller: winScrollController,
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
                                                playerMovesDisplayResults[
                                                    index]),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  childCount: playerMovesDisplayResults.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
