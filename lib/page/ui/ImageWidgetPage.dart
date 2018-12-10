import 'package:flutter/material.dart';

class ImageWidgetPage extends StatelessWidget {
  final title = "ImageWidgetPage";

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
            CircleAvatar(
              // 图片圆角效果
              backgroundImage: new NetworkImage(
                  "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58"),
              child: new Text("李二"),
              radius: 50, //可以在图片上添加文字等等
            ),
            new Card(
              // 卡片
              clipBehavior: Clip.antiAlias,
              elevation: 5.0,
              shape: new RoundedRectangleBorder(
                // 圆角
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              //Image.network 可以加载网络图片
              child: new Image.asset('images/banner1.jpg',
                  width: 150.0, height: 150.0, fit: BoxFit.cover),
            )
          ],
        ),
      ),
    );
  }
}
