import 'package:flutter/material.dart';
import 'package:flutter_app/homepage.dart';
import 'package:flutter_app/pagefour.dart';
import 'package:flutter_app/seconepage.dart';
import 'package:flutter_app/thepage.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageZero pageZero;
  PageOne pageOne;
  PageTwo pageTwo;
  PageFour pageFour;
  int currentIndex = 0;
  List<Widget> page;
  Widget currentPage;
  @override
  void initState() {
    super.initState();
    pageZero = PageZero();
    pageOne = PageOne();
    pageTwo = PageTwo();
    pageFour = PageFour();
    currentPage = pageZero;
    page = [pageZero, pageOne, pageTwo, pageFour];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: currentPage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentIndex = index;
              currentPage = page[index];
              print(page[index]);
            });
          },
          elevation: 5,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.hd),
              title: Text('home'),
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.build), title: Text('home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.signal_wifi_off), title: Text('home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.title), title: Text('home')),
          ],
        ),
      ),
    );
  }
}
