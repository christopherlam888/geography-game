import 'package:flutter/material.dart';
import 'package:geography_game/variables.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
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
                    const SizedBox(width: 10.0),
                    Switch(
                      value: countries,
                      activeColor: Colors.deepOrange,
                      onChanged: (bool value){
                        setState(() {
                           countries = value;
                           if (!countries && !capitals && !continents) {
                             countries = true;
                           }
                           if (countries && !colloquial && !official) {
                             colloquial = true;
                           }
                           if (!countries) {
                             colloquial = false;
                             official = false;
                           }
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
                    const SizedBox(width: 10.0),
                    Switch(
                        value: capitals,
                        activeColor: Colors.deepOrange,
                        onChanged: (bool value){
                          setState(() {
                            capitals = value;
                            if (!countries && !capitals && !continents) {
                              countries = true;
                              colloquial = true;
                            }
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
                    const SizedBox(width: 10.0),
                    Switch(
                        value: continents,
                        activeColor: Colors.deepOrange,
                        onChanged: (bool value){
                          setState(() {
                            continents = value;
                            if (!countries && !capitals && !continents) {
                              countries = true;
                              colloquial = true;
                            }
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
                    activeColor: Colors.deepOrange,
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
                    activeColor: Colors.deepOrange,
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
                    "Country Name Settings",
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
                    const SizedBox(width: 10.0),
                    Switch(
                        value: colloquial,
                        activeColor: Colors.deepOrange,
                        onChanged: (bool value){
                          setState(() {
                            colloquial = value;
                            if (colloquial) {
                              countries = true;
                            }
                            if (!colloquial && !official) {
                              countries = false;
                            }
                            if (!countries && !capitals && !continents) {
                              countries = true;
                              colloquial = true;
                            }
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
                              "Official Names",
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
                    const SizedBox(width: 10.0),
                    Switch(
                        value: official,
                        activeColor: Colors.deepOrange,
                        onChanged: (bool value){
                          setState(() {
                            official = value;
                            if (official) {
                              countries = true;
                            }
                            if (!colloquial && !official) {
                              countries = false;
                            }
                            if (!countries && !capitals && !continents) {
                              countries = true;
                              colloquial = true;
                            }
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
