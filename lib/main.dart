import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customeclipper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomClipperWidget(),
          child: Container(
            height: 400,
            color: Colors.orange,
          ),
        )
      ],
    );
  }
}
