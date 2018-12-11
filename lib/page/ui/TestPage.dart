// pages/NewsListPage.dart
import 'package:flutter/material.dart';
import 'package:mydemoproject/page/ui/SlideView.dart';

// 资讯列表页面
class OneListPage extends StatelessWidget {
  var slideData = [
    {"title": "Monster", "url": "http://p19.qhimg.com/t0105875656fd4673a8.jpg"},
    {"title": "Green", "url": "http://p18.qhimg.com/t01e3b8299af55c4db8.jpg"},
    {"title": "Space", "url": "http://p15.qhimg.com/t0163e280a86f558097.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: new SlideView(slideData),
      ),
    );
  }
}

// 资讯列表页面
class TwoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("TwoListPage"),
    );
  }
}

// 资讯列表页面
class ThreeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("ThreeListPage"),
    );
  }
}
