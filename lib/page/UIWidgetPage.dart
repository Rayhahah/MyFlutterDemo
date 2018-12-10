import 'package:flutter/material.dart';
import 'package:mydemoproject/page/ui/ButtonWidgetPage.dart';
import 'package:mydemoproject/page/ui/DialogWidgetPage.dart';
import 'package:mydemoproject/page/ui/ImageWidgetPage.dart';
import 'package:mydemoproject/page/ui/LoadingWidgetPage.dart';
import 'package:mydemoproject/page/ui/TextWidgetPage.dart';

class UIWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UIWidgetPageState();
  }
}

class UIWidgetPageState extends State<UIWidgetPage> {
  var itemInfo = [
    {"name": "Text", "icon": Icons.accessibility, "path": new TextWidgetPage()},
    {"name": "Button", "icon": Icons.ac_unit, "path": new ButtonWidgetPage()},
    {"name": "Dialog", "icon": Icons.dialpad, "path": new DialogWidgetPage()},
    {"name": "Image", "icon": Icons.image, "path": new ImageWidgetPage()},
    {
      "name": "Loading",
      "icon": Icons.sync_problem,
      "path": new LoadingWidgetPage()
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "UI Page",
          style: new TextStyle(color: Color(0xffffffff)),
        ),
      ),
      body: new GridView.count(
        //      横轴数量 这里的横轴就是x轴 因为方向是垂直的时候 主轴是垂直的
        crossAxisCount: 3,
        padding: const EdgeInsets.all(4.0),
        //主轴间隔
        mainAxisSpacing: 5.0,
        //横轴间隔
        crossAxisSpacing: 4.0,
        children: _buildGridList(itemInfo),
//        children: _buildGridTileList(itemInfo),
      ),
    );
  }

  List<Container> _buildGridList(List<Map<String, Object>> itemInfo) {
    return new List.generate(
        itemInfo.length,
        (int index) => new Container(
              child: new Card(
                child: new FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) {
                        return itemInfo[index]["path"];
                      }));
                    },
                    child: new Container(
                      padding: EdgeInsets.all(0),
                      alignment: Alignment.center,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(itemInfo[index]["icon"]),
                          new Text(itemInfo[index]["name"])
                        ],
                      ),
                    )),
              ),
            ));
  }
}
