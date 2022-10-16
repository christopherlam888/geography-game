import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

enum gamemode {singleplayer, two_player}

class _SettingsState extends State<Settings> {
  bool countries = true;
  bool capitals = true;
  bool continents = true;
  bool coloquial = true;
  bool abbrev = true;
  bool official = true;

  gamemode? mode = gamemode.two_player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: const Text("Settings"),
      ),
      body: Container(
        color: Colors.orange[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45.0, bottom: 10.0),
              child: Text(
                "Location Name Categories",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    "Countries",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Switch(
                  value: countries,
                  activeColor: Colors.red,
                  onChanged: (bool value){
                    setState(() {
                       countries = value;
                    });
                  }
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 27.6),
                  child: Text(
                    "Capitals",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Switch(
                    value: capitals,
                    activeColor: Colors.red,
                    onChanged: (bool value){
                      setState(() {
                        capitals = value;
                      });
                    }
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Text(
                    "Continents",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Switch(
                    value: continents,
                    activeColor: Colors.red,
                    onChanged: (bool value){
                      setState(() {
                        continents = value;
                      });
                    }
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 10.0,),
              child: Text(
                "Gamemode",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23.0,
                ),
              ),
            ),

            SizedBox(
              width: 202.0,
              child: RadioListTile(
                title: const Text(
                  "Single-player",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                value: gamemode.singleplayer,
                groupValue: mode,
                onChanged: (gamemode? value){
                  setState(() {
                    mode = value;
                  });
                },
              ),
            ),

            SizedBox(
              width: 202.0,
              child: RadioListTile(
                title: const Text(
                  "Two-player",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                value: gamemode.two_player,
                groupValue: mode,
                onChanged: (gamemode? value){
                  setState(() {
                    mode = value;
                  });
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
              child: Text(
                "Location Name Settings",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 24, bottom: 10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          "Coloquial Names",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text("e.g. North Korea"),
                    ],
                  ),
                ),
                Switch(
                    value: coloquial,
                    activeColor: Colors.red,
                    onChanged: (bool value){
                      setState(() {
                        coloquial = value;
                      });
                    }
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 27.6),
                        child: Text(
                          "Abbreviated Name",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      Text("e.g. DPRK"),
                    ],
                  ),
                ),
                Switch(
                    value: abbrev,
                    activeColor: Colors.red,
                    onChanged: (bool value){
                      setState(() {
                        abbrev = value;
                      });
                    }
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 34),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 3.0),
                        child: Text(
                          "Official Name",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text("e.g. Democratic People's \n       Republic of Korea"),
                    ],
                  ),
                ),

                Switch(
                    value: official,
                    activeColor: Colors.red,
                    onChanged: (bool value){
                      setState(() {
                        official = value;
                      });
                    }
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
