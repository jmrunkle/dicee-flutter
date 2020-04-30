import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 1;
  static var random = Random.secure();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                child: Image.asset('images/dice$leftDice.png'),
                onPressed: () => setState(() {
                  leftDice = rollDice();
                }),
              ),
            ),
            Expanded(
              child: FlatButton(
                child: Image.asset('images/dice$rightDice.png'),
                onPressed: () => setState(() {
                  rightDice = rollDice();
                }),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        RaisedButton(
          onPressed: () => setState(() {
            leftDice = rollDice();
            rightDice = rollDice();
          }),
          child: Text('Roll both'),
        ),
        SizedBox(
          height: 20.0,
        ),
        Center(
          child: Text(
            'Total: ${leftDice + rightDice}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }

  int rollDice() => random.nextInt(6) + 1;
}
