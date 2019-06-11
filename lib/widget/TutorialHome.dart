import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Counter1.dart';
import 'Counter2.dart';

class TutorialHome extends StatelessWidget {
  TextEditingController _userName = new TextEditingController();
  TextEditingController _unameController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _userName.text = "hello";
    _userName.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _userName.text.length,
    );
    _userName.addListener(() {
      print("_userName:" + _userName.text);
    });

    FocusNode focusNodeUserName = new FocusNode();
    FocusNode focusNodePassword = new FocusNode();
    String whichFocus = "";
    FocusScopeNode focusScopeNode;
    focusNodeUserName.addListener(() {
      if (focusNodeUserName.hasFocus) {
        whichFocus = "1";
      }
    });
    focusNodePassword.addListener(() {
      if (focusNodePassword.hasFocus) {
        whichFocus = "2";
      }
    });

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
      body: new SingleChildScrollView(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Hello World!'),
              new MyButton(),
              new IconButton(icon: new Icon(Icons.add), onPressed: _select),
              new Counter1(),
              new Counter2(),
              Form(
                key: _formKey, //设置globalKey,用于后面获取FormState
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "username/email",
                        prefixIcon: new Icon(Icons.person),
                      ),
                      inputFormatters: [
                        BlacklistingTextInputFormatter(RegExp("[/\\\\]")),
                      ],
                      controller: _userName,
                      focusNode: focusNodeUserName,
                    ),
                    TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "password",
                        prefixIcon: new Icon(Icons.person),
                      ),
                      obscureText: true,
                      focusNode: focusNodePassword,
                      onChanged: (v) {
                        print("onChange: $v");
                      },
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: _unameController,
                      decoration: InputDecoration(
                          labelText: "TextFormField",
                          hintText: "这是TextFormField",
                          icon: Icon(Icons.person)),
                      //校验输入内容
                      validator: (v) {
                        return v.trim().length > 5 ? null : "请输入大于5个内容";
                      },
                    ),
                    new RaisedButton(
                      child: new Text("切换焦点"),
                      onPressed: () {
                        if (null == focusScopeNode) {
                          focusScopeNode = FocusScope.of(context);
                        }
                        if (whichFocus == "1") {
                          print("切换到密码");
                          focusScopeNode.requestFocus(focusNodePassword);
                        } else if (whichFocus == "2") {
                          print("切换到账号");
                          focusScopeNode.requestFocus(focusNodeUserName);
                        }
                      },
                    ),
                    new RaisedButton(
                      child: new Text("TextFormField验证"),
                      onPressed: () {
                        if ((_formKey.currentState as FormState).validate()) {
                          //验证通过提交数据
                          print("验证通过");
                        } else {
                          print("验证不通过");
                        }
                      },
                    ),
                  ],
                ),
              ),
              Image.asset(
                "images/accept.png",
                width: 100.0,
                fit: BoxFit.fill,
              ),
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100.0,
                fit: BoxFit.fill,
              ),
              Icon(
                Icons.accessible,
                color: Colors.green,
                size: 100.0,
              ),
            ],
          ),
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
