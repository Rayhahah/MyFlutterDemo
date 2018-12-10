import 'package:flutter/material.dart';

class DialogWidgetPage extends StatelessWidget {
  final title = "DialogWidgetPage";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(title)),
      body: new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: new Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Card(
                child: new FlatButton(
                  onPressed: () {
                    _showSimpleDialog(context);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: new Text("Simple Dialog")),
                ),
              ),
              new Card(
                child: new FlatButton(
                  onPressed: () {
                    _showAlertDialog(context);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: new Text("Alert Dialog")),
                ),
              )
            ]),
      ),
    );
  }

  void _showSimpleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return new SimpleDialog(
            title: new Text('这是SimpleDialog'),
            children: <Widget>[
              new SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('确定'),
              ),
              new SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('取消'),
              ),
            ],
          );
        });
  }

  void _showAlertDialog(BuildContext context) {
    showDialog<Null>(
        context: context,
        barrierDismissible: false, // 不能点击对话框外关闭对话框，必须点击按钮关闭
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('提示'),
            content: new Text(
                '微软重申Windows 7将在2020年1月到达支持终点，公司希望利用这个机会说服用户在最新更新发布之前升级到Windows 10。'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('明白了'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
