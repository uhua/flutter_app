import 'package:flutter/material.dart';

import 'Counter1.dart';
import 'Counter2.dart';

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件
    return new Scaffold(
      //appBar
      appBar: new AppBar(
        leading: new AppBar(
          leading: new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null),
        ),
        title: new Text('这是title'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search), tooltip: 'Search', onPressed: null)
        ],
      ),

      //body站屏幕的大部分
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Text('Hello World!'),
            new MyButton(),
            new IconButton(icon: new Icon(Icons.add), onPressed: _select),
            new Counter1(),
            new Counter2(),
          ],
        ),
      ),

      floatingActionButton: new FloatingActionButton(
          tooltip: 'Add', child: new Icon(Icons.add), onPressed: null),
    );
  }

  void _select() {
    print('点击了按钮');
  }
}

/**
 * 点击按钮(GestureDetector)
 */

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('Engage'),
        ),
      ),
    );
  }
}
