import 'package:flutter/material.dart';
import 'package:flutter_app/Widget/widgetTest.dart';

import 'EchoRoute.dart';
import 'NewRoute.dart';
import 'Widget/ImageTest.dart';
import 'Widget/Imageends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //应用名称
      title: 'Flutter Demo',
      theme: new ThemeData(
        //蓝色主题
        primarySwatch: Colors.red,
      ),
      //应用首页路由
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      //注册路由表
      routes: {
        "new_page": (context) => NewRoute(),
        "argument_page": (context) => EchoRoute(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("跳转到新路由"),
              textColor: Colors.blue,
              onPressed: () {
                //跳转到新路由
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) {
                          return new NewRoute();
                        },
                        fullscreenDialog: true));
              },
            ),
            FlatButton(
              child: Text("带参路由"),
              textColor: Colors.pink,
              onPressed: () {
                //通过路由名跳转到带参路由
                Navigator.pushNamed(context, "argument_page",
                    arguments: "hello");
              },
            ),
            //这里用来跳转到测试路由
            FlatButton(
              child: Text("Test"),
              textColor: Colors.pink,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return new ImageTest();
                }));
              },
            ),
            //这里用来测试widget
            new ParentWidgetC(),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
