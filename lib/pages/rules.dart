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
        backgroundColor: Colors.orange[900],
        title: const Text("Rules"),
      ),
      body: Container(
        color: Colors.orange[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(

              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text(
                      "Rules",
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2.4,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 7.0, left: 14.0, right: 7.0, bottom: 7.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                        color: Colors.orange
                    ),
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: const SizedBox(
                    width: 300,
                    child: Text(
                        "[INSERT ACTUAL NAME] is made as a simple test for geography knowledge.\n\n"
                            "1. Type in the name of a present-day geographical location. "
                            "It can be a country, capital city, and continent.\n\n"
                            "2. Then pass the phone to your friend for them to enter another location.\n\n"
                            "3. The first letter of the location must be the same as the last letter of the "
                            "location entered previously. "
                            "If you are playing with the computer, the location will be automatically generated.\n\n"
                            "5. Location names cannot be repeated.\n\n"
                            "6. Alternate entering names until either player can no longer think of any more location names.\n\n"
                            "7. To win, the other player must be enter a location name that follows all the previous rules.\n\n"
                            "8. If the other player also cannot think of a location name, then the game ends in a tie.",
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
