import 'package:flutter/material.dart';

/*
 * 基础widget
 */
class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  Material 是UI呈现的"一张纸"
    return new Material(
      //  Column 是垂直方向的线性布局
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              '这是title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child: new Text('Hello world!'),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  //Widget子类中的字段往往都定义为"final"
  final Widget title;

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0, //单位是逻辑上的像素（并非真实的像素，类似浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      //Row  是水平方向的线性布局(Linearlayout)
      child: new Row(
        //列表项的类型是<Widget>
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null), // null 会禁用 button

          //Expanded标记后会填充未被占用的剩余可用空间
          //Expanded可用有多个children，用flex来确定比例
          //类似于weight
          new Expanded(child: title),

          new IconButton(
              icon: new Icon(Icons.search), tooltip: 'Search', onPressed: null)
        ],
      ),
    );
  }
}
