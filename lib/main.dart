import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

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
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return OfflineBuilder(
              connectivityBuilder: (BuildContext context,
                  ConnectivityResult connectivity, Widget child) {
                final bool connected = connectivity != ConnectivityResult.none;
                return connected
                    ? Container(
                        width: 250,
                        height: 250,
                        color: Colors.red,
                      )
                    : Container(
                        width: 250,
                        height: 250,
                        color: Colors.blue,
                      );
              },
              child: Center(
                child: Text(''),
              ),
            );
          },
        ),
      ),
    );
  }
}
