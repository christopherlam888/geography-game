import 'package:flutter/material.dart';
import 'package:geography_game/mystery_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mystery extends StatefulWidget {
  const Mystery({Key? key}) : super(key: key);

  @override
  State<Mystery> createState() => _MysteryState();
}

class _MysteryState extends State<Mystery> {
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    initSharedPreferences();
    super.initState();
  }

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Mystery"),
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
                    "Secret Settings",
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
                            width: 200.0,
                            child: Text(
                              "Canadian Capitals",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(width: 200.0, child: Text("e.g. Toronto")),
                          SizedBox(
                              width: 200.0, child: Text("e.g. Whitehorse")),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Switch(
                        value: canada,
                        activeColor: Colors.deepOrange,
                        onChanged: (bool value) {
                          setState(() {
                            canada = value;
                            sharedPreferences.setBool('canada', canada);
                          });
                        }),
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
                            width: 200.0,
                            child: Text(
                              "University of Waterloo Buildings",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 200.0,
                              child: Text("e.g. Ron Eydt Village")),
                          SizedBox(
                              width: 200.0,
                              child: Text("e.g. Engineering Seven")),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Switch(
                        value: waterloo,
                        activeColor: Colors.deepOrange,
                        onChanged: (bool value) {
                          setState(() {
                            waterloo = value;
                            sharedPreferences.setBool('waterloo', waterloo);
                          });
                        }),
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
