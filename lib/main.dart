import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Recipe App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.orange[500],
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('hello'),
            ),
          ],
        ),
      ),
      body: Center(
        child: IconButton(
            icon: Icon(Icons.access_time),
            onPressed: () {
              setState(() {
                _drawerKey.currentState.openDrawer();
              });
            }),
      ),
    );
  }
}
