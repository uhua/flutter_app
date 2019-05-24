import 'package:flutter/material.dart';
/**
 * StatefulWidget
 */

class Counter1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CounterState1();
  }
}

class _CounterState1 extends State<Counter1> {
  int _counter1 = 0;

  void _increment1() {
    setState(() {
      _counter1++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new RaisedButton(
          child: new Text('Increment'),
          onPressed: _increment1,
        ),
        new Text('Count: $_counter1'),
      ],
    );
  }
}
