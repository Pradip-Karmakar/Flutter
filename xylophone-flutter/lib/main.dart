import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();
  int node = 1;

  void plays(int node) => player.play('note$node.wav');

  Widget button(int node, Color color) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          plays(node);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                button(1, Colors.red),
                button(2, Colors.orange),
                button(3, Colors.yellow),
                button(4, Colors.green),
                button(3, Colors.teal),
                button(3, Colors.blue),
                button(3, Colors.purple),
              ],
            ),
          ),
        ),
      );
}
