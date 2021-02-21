import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('I am poor'),
          backgroundColor: Colors.blue[400],
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/salt.png'),
          ),
        ),
      ),
    );
  }
}
