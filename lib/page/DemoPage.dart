import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  DemoPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  DemoPageState createState() => new DemoPageState();
}

class DemoPageState extends State<DemoPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(widget.title),
          centerTitle: true),
      body: new ListView.builder(
        itemBuilder: (context, index) {
          return _obtainBaseItem("""
I am item Index=  $index,I am item Index=  $index,I am item Index=  $index,I am item Index=  $index,I am item Index=  $index,I am item Index=  $index,I am item Index=  $index,I am item Index=  $index,I am item Index=  $index,I am item Index=  $index
          """);
        },
        itemCount: _counter,
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add_circle),
      ),
    );
  }
}

//返回一个居中带图标和文本的Item
_obtainIconText(IconData icon, String text) {
  return new Expanded(
    flex: 1,
    //居中
    child: new Center(
      //横向布局
      child: new Row(
        //主轴居中，横向居中
        mainAxisAlignment: MainAxisAlignment.center,
        //大小按照最大填充
        mainAxisSize: MainAxisSize.max,
        //竖直方向居中
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, size: 16.0, color: Colors.grey),

          ///间隔
          new Padding(padding: new EdgeInsets.only(left: 5.0)),

          ///显示文本
          new Text(
            text,
            //设置字体样式：颜色灰色，字体大小14.0
            style: new TextStyle(color: Colors.grey, fontSize: 14.0),
            //超过的省略为...显示
            overflow: TextOverflow.ellipsis,
            //最长一行
            maxLines: 1,
          ),
        ],
      ),
    ),
  );
}

_obtainBaseItem(String desc) {
  return new Container(
      child: new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Card(
              child: new FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              print("click me");
            },
            child: new Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Container(
                    child: new Text(
                      desc,
                      style:
                          new TextStyle(color: Colors.blueGrey, fontSize: 14.0),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    alignment: Alignment.topLeft,
                  ),
                  new Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                  ),
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _obtainIconText(Icons.add_alarm, "100"),
                      _obtainIconText(Icons.receipt, "200"),
                      _obtainIconText(Icons.remove_shopping_cart, "300"),
                    ],
                  )
                ],
              ),
            ),
          ))));
}
