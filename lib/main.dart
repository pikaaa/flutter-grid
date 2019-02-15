import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    RandomColor _randomColor = RandomColor();

    Color _color = _randomColor.randomColor(
      // colorBrightness: ColorBrightness.light
    );

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          crossAxisCount: 2,
          // Generate 100 Widgets that display their index in the List
          children: List.generate(100, (index) {
            return Center(
                child: Container(
                // color:  _randomColor.randomColor(colorSaturation: ColorSaturation.lowSaturation),
                // padding: const EdgeInsets.all(50.0),
                decoration: new BoxDecoration(
                  color: _randomColor.randomColor(colorSaturation: ColorSaturation.lowSaturation),
                ),
                constraints: new BoxConstraints.expand(
                  // width: 250.0,
                ),
                alignment: FractionalOffset.center,
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline,
                ),
                // width: 220,
                // height: 150,
              ),

            );
          }),
        ),
      ),
    );
  }
}
