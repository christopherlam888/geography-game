import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch = Uri(
        scheme: 'https',
        host: 'github.com',
        path: 'christopherlam888/geography-game');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("About"),
      ),
      body: Container(
        color: Colors.orange[200],
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/globe.png'),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "Geography Game",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "Developed by",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    const Text(
                      "Christopher Lam and Justin Wang",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "A simple game to test your knowledge of geography. Name countries, capitals, and continents.",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "This project is licensed under the GNU General Public License v3.0.",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "See the project source code here:",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () => setState(() {
                        _launched = _launchInBrowser(toLaunch);
                      }),
                      child: const Text(
                        "Github",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
