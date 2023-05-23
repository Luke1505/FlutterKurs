import 'dart:html';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final double fontSize;
  const SecondPage({super.key, required this.fontSize});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppName"),
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => {
            Navigator.of(context).pop("Blomi"),
          },
        ),
      ),
      body: SafeArea(
          child: Text(
        "Zweite Seite",
        style: TextStyle(fontSize: widget.fontSize),
      )),
    );
  }
}
