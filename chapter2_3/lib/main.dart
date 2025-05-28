import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        brightness:Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF212121),
        // accentColor: const Color(0xFF64ffda),
        canvasColor: const Color(0xFF303030),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('App Name'),
          ),
        body:
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(
              "qWerty1",
                style: new TextStyle(fontSize:12.0,
                color: const Color(0xFFffffff),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),
    
              new Text(
              "qWerty2",
                style: new TextStyle(fontSize:12.0,
                color: const Color(0xFFffffff),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),
    
              new Text(
              "qWerty3",
                style: new TextStyle(fontSize:12.0,
                color: const Color(0xFFffffff),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              )
            ]
    
          ),
    
      );
    }
}