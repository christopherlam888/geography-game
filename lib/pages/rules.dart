import 'package:flutter/material.dart';

class Rules extends StatefulWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  State<Rules> createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Rules"),
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
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Text(
                          "Rules",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                            color: Colors.deepOrange,
                        ),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: const SizedBox(
                        width: 300,
                        child: Text(
                            "Geography Game is made as a simple test of geography knowledge.\n\n"
                                "1. Begin by typing in the name of any present-day geographical location. "
                                "It can be a country, capital city, or continent depending on your settings.\n\n"
                                "2. Pass the phone to your friend to enter another location. "
                                "If you are playing in single player mode, the location will be automatically generated.\n\n"
                                "3. The first letter of a location entered must be the same as either the last letter of the "
                                "previous location entered or the randomly-generated letter. \n\n"
                                "4. Location names cannot be repeated.\n\n"
                                "5. Take turns entering locations until either player can no longer think of any more locations.\n\n"
                                "6. To win, the other player must enter a final location that follows all the previous rules.\n\n"
                                "7. If the other player also cannot think of a location, then the game ends in a tie.\n\n"
                                "8. In the event that all possible locations are played, two players tie and a single player wins.",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
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
