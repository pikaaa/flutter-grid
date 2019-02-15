import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:random_color/random_color.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid list Demo',
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Grid'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          crossAxisCount: 2,
          // Generate 100 Widgets that display their index in the List
          children: List.generate(100, (index) {
            Color _color = RandomColor().randomColor(colorSaturation: ColorSaturation.lowSaturation);
            return InkWell(
                child: Container(
                  // color:  _randomColor.randomColor(colorSaturation: ColorSaturation.lowSaturation),
                  // margin: const EdgeInsets.fromLTRB(16,8,8,16),
                  decoration: new BoxDecoration(
                    color: _color,
                  ),
                  constraints: new BoxConstraints.expand(
                    // width: 250.0,
                  ),
                  alignment: FractionalOffset.center,
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headline,
                  ),
              ),
              onTap: () {
                      print("tapped on container");
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        child: new CupertinoAlertDialog(
                          title: new Column(
                            children: <Widget>[
                              new Text("You're seeing an alert")
                            ],
                          ),
                          content: new Text("content"),
                          actions: <Widget>[
                            new FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: new Text("OK")
                            )
                          ],
                        )
                      );

                      },
            );
          }),
        ),
    );
  }
}
