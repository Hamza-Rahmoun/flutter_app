import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/defaulttabbar/newscreen.dart';
import 'package:flutter_app/defaulttabbar/popualrscreen.dart';
import 'package:flutter_app/defaulttabbar/recommended.dart';
import 'package:flutter_app/sizeconfig.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 4 * SizeConfig.widthMultiplier,
                vertical: 5 * SizeConfig.heightMultiplier),
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 2.7 * SizeConfig.textMultiplier,
                        letterSpacing: 2,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Icon(
                      Icons.favorite_border,
                      size: 5 * SizeConfig.widthMultiplier,
                      color: Colors.red,
                    ),
                  ],
                ),
                SizedBox(height: 3 * SizeConfig.heightMultiplier),
                Container(
                  height: 8 * SizeConfig.heightMultiplier,
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    textScaleFactor: 1,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 3.5 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text: 'Hello ,',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 3.5 * SizeConfig.textMultiplier,
                          ),
                        ),
                        TextSpan(
                            text: 'What Are You ',
                            style: TextStyle(
                              fontSize: 3.5 * SizeConfig.textMultiplier,
                            )),
                        TextSpan(
                          text: 'Looking For ...',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 3.5 * SizeConfig.textMultiplier,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 5 * SizeConfig.heightMultiplier,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Food Country',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 2 * SizeConfig.textMultiplier,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.red,
                        size: 3 * SizeConfig.textMultiplier,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 15 * SizeConfig.heightMultiplier,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (ctx, i) {
                      return Container(
                        height: 15 * SizeConfig.heightMultiplier,
                        width: 20 * SizeConfig.widthMultiplier,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 5 * SizeConfig.heightMultiplier,
                  child: Text(
                    'VIEW ALL -',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 3 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Container(
                  height: 7 * SizeConfig.heightMultiplier,
                  child: TabBar(
                    indicatorColor: Colors.green,
                    indicatorWeight: 0.7 * SizeConfig.widthMultiplier,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    labelStyle: TextStyle(
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: <Widget>[
                      Tab(
                        text: 'Popular',
                      ),
                      Tab(
                        text: 'New',
                      ),
                      Tab(
                        text: 'Recommended',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2 * SizeConfig.heightMultiplier,
                ),
                Container(
                  height: 38 * SizeConfig.heightMultiplier,
                  child: TabBarView(
                    children: <Widget>[
                      PopularScreen(),
                      NewScreen(),
                      RecommendedScreen(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
