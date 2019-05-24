import 'package:flutter/material.dart';

/**
 *稍微复杂点的通信
 */

class Counter2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CounterState2();
  }
}

class _CounterState2 extends State<Counter2> {
  int _counter2 = 0;

  void _increment2() {
    setState(() {
      ++_counter2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new CounterIncrementor(
          onPressed: _increment2,
        ),
        new CounterDisplay(
          count: _counter2,
        ),
      ],
    );
  }
}

class CounterDisplay extends StatelessWidget {
  final int count;

  CounterDisplay({this.count});

  @override
  Widget build(BuildContext context) {
    return new Text('Conut: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  final VoidCallback onPressed;

  CounterIncrementor({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: new Text('Increment'),
      onPressed: onPressed,
    );
  }
}
