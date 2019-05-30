import 'package:flutter/material.dart';

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    //...省略无关代码
    return Scaffold(
      appBar: AppBar(
        title: Text("带参Route"),
      ),
      body: Center(
        child: Text("This is 参数:" + args),
      ),
    );
  }
}
