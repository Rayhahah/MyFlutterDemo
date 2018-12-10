import 'package:flutter/material.dart';
import 'package:mydemoproject/page/DemoPage.dart';
import 'package:mydemoproject/page/MainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // flutter emulators --launch Pixel_API_26
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
        accentColor: Colors.pink,
      ),
//      home: DemoPage(title: 'Flutter Demo Home Page'),
      home: MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}
