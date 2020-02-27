import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/sizeconfig.dart';
import 'package:flutter_app/widget/customacliper.dart';

class HomePageProvider with ChangeNotifier {
  Widget buildDrawer() {
    return Builder(
      builder: (context) {
        return Expanded(
          child: Container(
            color: const Color(0xFF262AAA),
            child: Column(
              children: <Widget>[],
            ),
          ),
        );
      },
    );
  }

  Widget buildAlignContainer({Function pressed, Animation<double> progress}) {
    return Builder(
      builder: (context) {
        return Align(
          alignment: Alignment(0, -0.97),
          child: GestureDetector(
            onTap: pressed,
            child: ClipPath(
              clipper: CustomMenuClipper(),
              child: Container(
                height: 17 * SizeConfig.heightMultiplier,
                width: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFF262AAA),
                  border: Border.all(
                    width: 0,
                    color: Color(0xFF262AAA),
                  ),
                ),
                alignment: Alignment.center,
                child: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: progress,
                  color: Color(0xffffffff),
                  size: 3.5 * SizeConfig.textMultiplier,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
