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
  Color color = Colors.red.shade900;

  @override
  void initState() {
    fontSize = standartFontSize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void createSnackBar(String text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(text),
      ));
    }

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
                              createSnackBar("Schriftart vergrößert.")
                            }))
                      },
                  child: const Icon(Icons.add)),
              ElevatedButton(
                  onPressed: () => {
                        setState((() => {
                              fontSize--,
                              createSnackBar("Schriftart verkleinert.")
                            }))
                      },
                  child: const Icon(Icons.remove)),
              ElevatedButton(
                onPressed: () => {
                  setState((() => {
                        fontSize = standartFontSize,
                        createSnackBar("Schriftart zurückgesetzt.")
                      }))
                },
                child: const Icon(Icons.replay_outlined),
              )
            ],
          ),
        ],
      )),
    );
  }
}
