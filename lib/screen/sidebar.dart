import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/widget/customacliper.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  final _animationDuration = const Duration(milliseconds: 500);
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  Orientation orientation;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              buildDrawer(),
              buildAlignContainer(),
            ],
          ),
        );
      },
    );
  }

  Widget buildDrawer() {
    return Builder(
      builder: (context) {
        return Expanded(
          child: Container(
            color: const Color(0xFF262AAA),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                ListTile(
                  title: Text(
                    "Prateek",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    "www.techieblossom.com",
                    style: TextStyle(
                      color: Color(0xFF1BB5FD),
                      fontSize: 18,
                    ),
                  ),
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.perm_identity,
                      color: Colors.white,
                    ),
                    radius: 40,
                  ),
                ),
                Divider(
                  height: 64,
                  thickness: 0.5,
                  color: Colors.white.withOpacity(0.3),
                  indent: 32,
                  endIndent: 32,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildAlignContainer() {
    return Align(
      alignment: Alignment(0, -0.9),
      child: GestureDetector(
        onTap: () => onIconPressed(),
        child: ClipPath(
          clipper: CustomMenuClipper(),
          child: Container(
            height: 110,
            width: 35,
            decoration: BoxDecoration(
                color: const Color(0xFF262AAA),
                border: Border.all(
                  width: 0,
                )),
            alignment: Alignment.centerLeft,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animationController.view,
              color: Color(0xFF1BB5FD),
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
