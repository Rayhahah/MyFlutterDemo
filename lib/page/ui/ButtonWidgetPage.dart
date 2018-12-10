import 'package:flutter/material.dart';

class ButtonWidgetPage extends StatelessWidget {
  final title = "ButtonWidgetPage";

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
              new RaisedButton(
                child: new Text("Raised Button"),
                color: Color(0x33000000),
                onPressed: () {},
              ),
              new FloatingActionButton(
                child: new Icon(Icons.add),
                backgroundColor: Colors.amber,
                foregroundColor: Colors.blue,
                elevation: 10,
                onPressed: () {},
              ),
              new FlatButton(
                  highlightColor: Colors.indigo,
                  color: Colors.lightGreenAccent,
                  colorBrightness: Brightness.dark,
                  onPressed: () {},
                  child: new Text("Flat Button")),
              new IconButton(
                  highlightColor: Colors.indigo,
                  icon: new Icon(Icons.list),
                  onPressed: () {}),
              new PopupMenuButton(onSelected: (value) {
                print(value);
              }, itemBuilder: (context) {
                return [
                  const PopupMenuItem<String>(
                    value: "add",
                    child: const Text('Working a lot harder'),
                  ),
                  const PopupMenuItem<String>(
                    value: "edit",
                    child: const Text('Being a lot smarter'),
                  ),
                  const PopupMenuItem<String>(
                    value: "delete",
                    child: const Text('Being a self-starter'),
                  ),
                  const PopupMenuItem<String>(
                    value: "cancel",
                    child: const Text('Placed in charge of trading charter'),
                  ),
                ];
              })
            ]),
      ),
    );
  }
}
