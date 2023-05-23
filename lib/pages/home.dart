import 'package:flutter/material.dart';
import 'second.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final double standartFontSize = 28;
  late double fontSize;
  // Farbe
  Color color = const Color.fromARGB(255, 114, 137, 218);

  void startAlertDialog() async {
    await Future.delayed(const Duration(milliseconds: 15000));
    createAlertDialog(
      title: "Bewertung abgeben!",
      description: "Bitte bewerten sie die app!!!",
      buttons: [
        TextButton(
            onPressed: () => {
                  setState((() => {Navigator.of(context).pop()}))
                },
            child: const Text("5 Sterne"))
      ],
    );
  }

  @override
  void initState() {
    fontSize = standartFontSize;
    startAlertDialog();
    super.initState();
  }

  void createSnackBar({String? text}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text ?? ''),
      duration: const Duration(milliseconds: 500),
    ));
  }

  void createAlertDialog(
      {required String? title,
      required String? description,
      required List<Widget> buttons}) {
    Widget alert = AlertDialog(
        title: Text(title ?? ''),
        content: Text(description ?? ''),
        actions: buttons);
    showDialog(context: context, builder: (context) => alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppName"),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: color),
              child: const Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          InkWell(
            child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
                child: Text(
                  'Herzlich Willkommen!',
                  style: TextStyle(fontSize: fontSize),
                )),
            onTap: () => createSnackBar(text: "Herzlich Willkommen!"),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => {
                  setState((() => {
                        fontSize++,
                        createSnackBar(text: "Schriftart vergrößert.")
                      }))
                },
                style: ElevatedButton.styleFrom(backgroundColor: color),
                child: const Icon(Icons.add),
              ),
              ElevatedButton(
                  onPressed: () => {
                        setState((() => {
                              fontSize--,
                              createSnackBar(text: "Schriftart verkleinert.")
                            }))
                      },
                  style: ElevatedButton.styleFrom(backgroundColor: color),
                  child: const Icon(Icons.remove)),
              ElevatedButton(
                  onPressed: () => {
                        setState((() => {
                              createSnackBar(text: "Schriftart zurückgesetzt."),
                              createAlertDialog(
                                title: "Schriftgröße zurücksetzen?",
                                description:
                                    "Möchten sie die Schriftgröße zurücksetzen?",
                                buttons: [
                                  TextButton(
                                      onPressed: () => {
                                            setState((() => {
                                                  fontSize = standartFontSize,
                                                  Navigator.of(context).pop()
                                                }))
                                          },
                                      child: const Text("Ja")),
                                  TextButton(
                                      onPressed: () => {
                                            createSnackBar(
                                                text: "Du hast Nein gedrückt"),
                                            Navigator.of(context).pop()
                                          },
                                      child: const Text("Nein"))
                                ],
                              )
                            }))
                      },
                  style: ElevatedButton.styleFrom(backgroundColor: color),
                  child: const Icon(Icons.replay_outlined)),
              ElevatedButton(
                  onPressed: () async {
                    dynamic result = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                SecondPage(fontSize: fontSize)));
                    createSnackBar(text: result);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: color),
                  child: const Icon(Icons.note_add_outlined))
            ],
          ),
          const SizedBox(height: 40)
        ],
      )),
    );
  }
}
