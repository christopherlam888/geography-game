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
  bool colloquial = true;
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
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 45.0, bottom: 10.0),
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
                    const SizedBox(
                      width: 100.0,
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
                    const SizedBox(
                      width: 100.0,
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
                    const SizedBox(
                      width: 100.0,
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

                const Padding(
                  padding: EdgeInsets.only(top: 25.0, bottom: 10.0,),
                  child: Text(
                    "Gamemode",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 23.0,
                    ),
                  ),
                ),

                SizedBox(
                  width: 210.0,
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
                    activeColor: Colors.red,
                    onChanged: (gamemode? value){
                      setState(() {
                        mode = value;
                      });
                    },
                  ),
                ),

                SizedBox(
                  width: 210.0,
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
                    activeColor: Colors.red,
                    onChanged: (gamemode? value){
                      setState(() {
                        mode = value;
                      });
                    },
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
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
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Column(
                        children: const [
                          SizedBox(
                            width: 180.0,
                            child: Text(
                              "Colloquial Names",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 180.0,
                            child: Text("e.g. North Korea")),
                        ],
                      ),
                    ),
                    Switch(
                        value: colloquial,
                        activeColor: Colors.red,
                        onChanged: (bool value){
                          setState(() {
                            colloquial = value;
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
                        children: const [
                          SizedBox(
                            width: 180.0,
                            child: Text(
                              "Abbreviated Name",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 180.0,
                            child: Text("e.g. DPRK")),
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
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Column(
                        children: const [
                          SizedBox(
                            width: 180.0,
                            child: Text(
                              "Official Name",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 180.0,
                            child: Text("e.g. Democratic People's Republic of Korea")),
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
          ],
        ),
      ),
    );
  }
}
