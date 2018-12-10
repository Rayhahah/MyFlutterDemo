import 'package:flutter/material.dart';
import 'package:mydemoproject/page/UIWidgetPage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  var itemInfo = [
    {"name": "UI Widget", "path": new UIWidgetPage()}
  ];

  @override
  void initState() {
    super.initState();
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
          return _obtainMainItem(itemInfo[index]);
//          return _obtainBaseItem(itemInfo[index]["name"]);
        },
        itemCount: itemInfo.length,
      ),
    );
  }

  Widget _obtainMainItem(Map<String, Object> itemInfo) {
    return new Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: new Card(
          child: new FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) {
                  return itemInfo["path"];
                },
              ));
            },
            child: new Container(
              child: new Text(
                itemInfo["name"],
                style: new TextStyle(color: Colors.blueGrey, fontSize: 14.0),
              ),
              margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30.0),
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
