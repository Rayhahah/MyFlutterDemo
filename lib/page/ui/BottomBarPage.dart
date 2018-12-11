import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydemoproject/page/ui/TestPage.dart';

class BottomBarPage extends StatefulWidget {
  BottomBarPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  BottomBarPageState createState() => new BottomBarPageState();
}

class BottomBarPageState extends State<BottomBarPage> {
  // 页面当前选中的Tab的索引
  static var _tabIndex = 0;
  var tabBarTitle = ["首页", "发现", "我的"];

  var tabTextStyleSelected =
      new TextStyle(color: Colors.lightGreen, fontSize: 12);
  var tabTextStyleNormal = new TextStyle(color: Colors.grey, fontSize: 10);

  var tabIconList = [
    [
      Icon(Icons.explore, color: Colors.lightGreen),
      Icon(Icons.explore, color: Colors.grey)
    ],
    [
      Icon(Icons.home, color: Colors.lightGreen),
      Icon(Icons.home, color: Colors.grey)
    ],
    [
      Icon(Icons.person, color: Colors.lightGreen),
      Icon(Icons.person, color: Colors.grey)
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title), centerTitle: true),
      body: new IndexedStack(
        children: <Widget>[
          new OneListPage(),
          new TwoListPage(),
          new ThreeListPage(),
        ],
        index: _tabIndex,
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        tooltip: 'Increment',
        child: new Icon(Icons.arrow_back),
      ),
      bottomNavigationBar: new CupertinoTabBar(
        items: _getBottomItems(),
        onTap: (int index) {
          setState(() {
            _tabIndex = index;
          });
        },
        currentIndex: _tabIndex,
      ),
      // drawer属性用于为当前页面添加一个侧滑菜单
      drawer: new Drawer(
        child: new Center(child: new Text("this is a drawer")),
      ),
    );
  }

  _getBottomItems() {
    List<BottomNavigationBarItem> result = List.generate(3, (index) {
      return new BottomNavigationBarItem(
          icon: getTabIcon(index), title: getTabTitle(index));
    });
    return result;
  }

  getTabIcon(int index) {
    if (index == _tabIndex) {
      return tabIconList[index][0];
    } else {
      return tabIconList[index][1];
    }
  }

  getTabTitle(int index) {
    return new Text(tabBarTitle[index], style: getTabTextStyle(index));
  }

  ///tab样式
  getTabTextStyle(int index) {
    if (index == _tabIndex) {
      return tabTextStyleSelected;
    } else {
      return tabTextStyleNormal;
    }
  }
}
