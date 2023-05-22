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

  @override
  void initState() {
    fontSize = standartFontSize;
    super.initState();
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
                        setState((() => {fontSize++}))
                      },
                  child: const Icon(Icons.add)),
              ElevatedButton(
                  onPressed: () => {
                        setState((() => {fontSize--}))
                      },
                  child: const Icon(Icons.remove)),
              ElevatedButton(
                  onPressed: () => {
                        setState((() => {fontSize = standartFontSize}))
                      },
                  child: const Icon(Icons.replay_outlined))
            ],
          ),
        ],
      )),
    );
  }
}
