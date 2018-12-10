import 'package:flutter/material.dart';

class TextWidgetPage extends StatelessWidget {
  final title = "TextWidgetPage";

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {},
              onDoubleTap: () {},
              onLongPress: () {},
              child: new Text(
                "I am Text",
                style: new TextStyle(
                    // 或者用这种写法：const Color(0xFF6699FF) 必须使用AARRGGBB
                    color: Colors.red,
                    // 字号
                    fontSize: 20.0,
                    // 字体加粗
                    fontWeight: FontWeight.bold,
                    // 斜体
                    fontStyle: FontStyle.italic,
                    decoration: new TextDecoration.combine(
                        // 文本加下划线
                        [TextDecoration.underline])),
              ),
            ),
            new TextField(
                maxLines: 5,
                maxLength: 50,
                decoration: new InputDecoration(
                    // 给输入框添加样式
                    hintText: "Input something...", // 输入框中placeholder文本
                    border: new OutlineInputBorder(
                        // 输入框的边框
                        borderRadius:
                            const BorderRadius.all(Radius.circular(1.0)))))
          ],
        ),
      ),
    );
  }
}
