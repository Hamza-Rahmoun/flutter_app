import 'package:flutter/material.dart';
import 'package:flutter_app/screen/pageone.dart';
import 'package:flutter_app/screen/sidebar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageOne(),
        SideBar(),
      ],
    );
  }
}
