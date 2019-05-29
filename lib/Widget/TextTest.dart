import 'package:flutter/material.dart';

class TextTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("TextTest"),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
            textAlign: TextAlign.left,
          ),
          new Text(
            "1" * 100,
            maxLines: 2,
            overflow: TextOverflow.visible,
            style: new TextStyle(
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
          new Text(
            "ccccc",
            textScaleFactor: 1.5,
          ),
          new Text.rich(TextSpan(children: [
            TextSpan(text: "我已经详细阅读:"),
            TextSpan(
                text: "修仙准则",
                style: TextStyle(
                  color: Colors.blue,
                )),
          ])),
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("hello world"),
                new Text("new Text"),
                Text(
                  "change",
                  style: TextStyle(
                      inherit: false, //2.不继承默认样式
                      color: Colors.blue),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
