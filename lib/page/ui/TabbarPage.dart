import 'package:flutter/material.dart';

class TabbarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TabbarPageState();
  }
}

class TabbarPageState extends State<TabbarPage>
    with SingleTickerProviderStateMixin {
  ///每个 Tab 对应的 StatefulWidget 的 State
  /// 需要通过with AutomaticKeepAliveClientMixin
  ///然后重写 @override bool get wantKeepAlive => true; ，就可以实不重新构建的效果了

  var currentStatus = "0";

  TabController _tabController;

  PageController _pageController;

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
    _pageController = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return _obtainTabBar();
  }

  List<Widget> obtainMenu() {
    return <Widget>[
      Container(
          alignment: Alignment.centerRight,
          child: new PopupMenuButton(onSelected: (value) {
            setState(() {
              currentStatus = value;
            });
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem<String>(
                value: "0",
                child: const Text('DefaultTabController'),
              ),
              const PopupMenuItem<String>(
                value: "1",
                child: const Text('CustomTabController'),
              ),
              const PopupMenuItem<String>(
                value: "2",
                child: const Text('PageController'),
              ),
            ];
          }))
    ];
  }

  Widget _obtainTabBar() {
    switch (currentStatus) {
      case "0":
        return obtainDefaultTabController();
        break;
      case "1":
        return obtainCustomTabController();
        break;
      case "2":
        return obtainPageController();
        break;
    }
  }

  Widget obtainDefaultTabController() {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('DefaultTabController'),
          actions: obtainMenu(),
          bottom: new TabBar(
            isScrollable: false,
            indicator: BoxDecoration(color: Colors.redAccent),
            tabs: <Widget>[
              new Tab(
                text: "test",
                icon: new Icon(Icons.directions_bike),
              ),
              new Tab(
                icon: new Icon(Icons.directions_boat),
              ),
              new Tab(
                icon: new Icon(Icons.directions_bus),
              ),
            ],
//            controller: _tabController,
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            new Center(child: new Text('自行车')),
            new Center(child: new Text('船')),
            new Center(child: new Text('巴士')),
          ],
        ),
      ),
    );
  }

  Widget obtainCustomTabController() {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CustomTabController"),
        actions: obtainMenu(),
        bottom: new TabBar(
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.directions_bike),
            ),
            new Tab(
              icon: new Icon(Icons.directions_boat),
            ),
            new Tab(
              icon: new Icon(Icons.directions_bus),
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: new TabBarView(controller: _tabController, children: <Widget>[
        new Center(child: new Text('自行车')),
        new Center(child: new Text('船')),
        new Center(child: new Text('巴士')),
      ]),
    );
  }

  Widget obtainPageController() {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("PageController"),
        actions: obtainMenu(),
        bottom: new TabBar(
            controller: _tabController,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black12,
            indicatorWeight: 10,
            tabs: [
              InkWell(
                onTap: () {
                  _pageController.jumpTo(MediaQuery.of(context).size.width * 0);
//              _pageController.animateToPage(0, duration: null, curve: null);
                },
                child: new Tab(
                  icon: new Icon(Icons.directions_bike),
                ),
              ),
              InkWell(
                onTap: () {
                  _pageController.jumpTo(MediaQuery.of(context).size.width * 1);
//              _pageController.animateToPage(1, duration: null, curve: null);
                },
                child: new Tab(
                  icon: new Icon(Icons.directions_boat),
                ),
              ),
              InkWell(
                onTap: () {
                  _pageController.jumpTo(MediaQuery.of(context).size.width * 2);
//              _pageController.animateToPage(2, duration: null, curve: null);
                },
                child: new Tab(
                  icon: new Icon(Icons.directions_bus),
                ),
              ),
            ]),
      ),
      body: new PageView(
        ///必须有的控制器，与tabBar的控制器同步
        controller: _pageController,

        ///每一个 tab 对应的页面主体，是一个List<Widget>
        children: [
          new Center(child: new Text('自行车')),
          new Center(child: new Text('船')),
          new Center(child: new Text('巴士')),
        ],
        onPageChanged: (index) {
          ///页面触摸作用滑动回调，用于同步tab选中状态
          _tabController.animateTo(index);
        },
      ),
    );
  }
}
