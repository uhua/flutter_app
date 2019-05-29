import 'package:flutter/material.dart';

class ButtonTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ButtonTest"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: () => {},
              child: Text("RaisedButton"),
            ),
            new FlatButton(
              onPressed: () => {},
              child: Text("FlatButton"),
            ),
            new OutlineButton(
              onPressed: () => {},
              child: new Text("OutlineButton"),
            ),
            new IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () => {},
            ),
            //自定义按钮,以FlatButton为例:
            new RaisedButton(
              highlightColor: Colors.pink[700],
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => {},
              child: Text("自定义FlatButton"),
            )
          ],
        ),
      ),
    );
  }
}
