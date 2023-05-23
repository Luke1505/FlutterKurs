import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final double standartFontSize = 18;
  late double fontSize;
  // Farbe
  Color color = const Color.fromARGB(255, 114, 137, 218);

  @override
  void initState() {
    fontSize = standartFontSize;
    super.initState();
  }

  void createSnackBar({String? text, required BuildContext context}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text ?? ''),
      duration: const Duration(milliseconds: 50),
    ));
  }

  void createAlertDialog() {
    Widget alert = AlertDialog(
      title: const Text("Test Alert."),
      content: const Text("Dies ist eine Test Nachricht"),
      actions: [
        TextButton(
            onPressed: () => {
                  createSnackBar(context: context, text: "Du hast Ja gedrückt"),
                  Navigator.of(context).pop()
                },
            child: const Text("Ja")),
        TextButton(
            onPressed: () => {
                  createSnackBar(
                      context: context, text: "Du hast Nein gedrückt"),
                  Navigator.of(context).pop()
                },
            child: const Text("Nein"))
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Text(
              'Herzlich Willkommen!',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => {
                  setState((() => {
                        fontSize++,
                        createSnackBar(
                            text: "Schriftart vergrößert.", context: context)
                      }))
                },
                style: ElevatedButton.styleFrom(backgroundColor: color),
                child: const Icon(Icons.add),
              ),
              ElevatedButton(
                  onPressed: () => {
                        setState((() => {
                              fontSize--,
                              createSnackBar(
                                  text: "Schriftart verkleinert.",
                                  context: context)
                            }))
                      },
                  style: ElevatedButton.styleFrom(backgroundColor: color),
                  child: const Icon(Icons.remove)),
              ElevatedButton(
                  onPressed: () => {
                        setState((() => {
                              fontSize = standartFontSize,
                              createSnackBar(
                                  text: "Schriftart zurückgesetzt.",
                                  context: context),
                              createAlertDialog()
                            }))
                      },
                  style: ElevatedButton.styleFrom(backgroundColor: color),
                  child: const Icon(Icons.replay_outlined))
            ],
          ),
          const SizedBox(height: 40),
        ],
      )),
    );
  }
}
