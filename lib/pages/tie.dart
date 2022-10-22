import 'package:flutter/material.dart';
import 'package:geography_game/variables.dart';
import 'package:geography_game/functions.dart';

class Tie extends StatefulWidget {
  const Tie({Key? key}) : super(key: key);

  @override
  State<Tie> createState() => _TieState();
}

class _TieState extends State<Tie> {

  final tieScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Tie!"),
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
                        "You Tie!",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Turn #$turnCountResult",
                      style: const TextStyle(
                        fontSize: 20.0,
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
                        controller: tieScrollController,
                        radius: const Radius.circular(2.5),
                        thickness: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                          child: CustomScrollView(
                            controller: tieScrollController,
                            slivers: <Widget> [
                              SliverGrid(
                                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 118.5,
                                  mainAxisSpacing: 3.0,
                                  crossAxisSpacing: 3.0,
                                  childAspectRatio: 3.0,
                                ),
                                delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                        color: index.isEven ? Colors.red[400] : Colors.blue[400],
                                      ),
                                      alignment: Alignment.center,
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            toProperCase(playerMovesDisplayResults[index]),
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
