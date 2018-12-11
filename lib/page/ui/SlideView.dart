import 'package:flutter/material.dart';

class SlideView extends StatefulWidget {
  var data;

  // data表示轮播图中的数据
  SlideView(data) {
    this.data = data;
  }

  @override
  State<StatefulWidget> createState() {
    return new SlideViewState(data);
  }
}

class SlideViewState extends State<SlideView>
    with SingleTickerProviderStateMixin {
  List slideData;

  TabController tabController;

  SlideViewState(data) {
    slideData = data;
  }

  @override
  void initState() {
    super.initState();
    // 初始化控制器
    tabController = new TabController(
        length: slideData == null ? 0 : slideData.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List.generate(slideData.length, (index) {
      var title = slideData[index]["title"];
      var url = slideData[index]["url"];
      return new GestureDetector(
        onTap: () {},
        child: new Stack(
          children: <Widget>[
            new Image.network(
              url,
              height: MediaQuery.of(context).size.height / 2,
              fit: BoxFit.cover,
            ),
            new Container(
              height: MediaQuery.of(context).size.height / 2,
              // 标题容器宽度跟屏幕宽度一致
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: new Text(
                title,
                style: new TextStyle(color: Colors.white, fontSize: 30),
              ),
            )
          ],
        ),
      );
    });
    return new TabBarView(controller: tabController, children: widgets);
  }
}
