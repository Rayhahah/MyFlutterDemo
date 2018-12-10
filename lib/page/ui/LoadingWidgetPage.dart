import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidgetPage extends StatelessWidget {
  final title = "LoadingWidgetPage";

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
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    new CircularProgressIndicator(
                      backgroundColor: Colors.lightGreen,
                    ),
                    new Padding(padding: EdgeInsets.only(top: 20)),
                    new Text("Loading"),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                width: 100,
                height: 100,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    new SpinKitRipple(color: Colors.lightGreen),
                    new Padding(padding: EdgeInsets.only(top: 10)),
                    new Text("Loading"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
