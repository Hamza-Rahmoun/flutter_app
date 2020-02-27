import 'package:flutter/material.dart';

class RecommendedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                children: <Widget>[
                  Expanded(child: _buildStory(0.1, 0.2, null, '')),
                  Expanded(child: _buildStory(0.1, 0.2, null, '')),
                ],
              ),
            ),
            Expanded(child: _buildStory(0.19, 0.1, null, '')),
          ],
        ),
        _buildStory(0.15, double.infinity,
            ColorFilter.mode(Colors.black54, BlendMode.darken), '+24'),
      ],
    );
  }

  Widget _buildStory(double bottomHeight, double bottomWidth,
      ColorFilter colorFilter, String title) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: MediaQuery.of(context).size.height * bottomHeight,
            width: MediaQuery.of(context).size.height * bottomWidth,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
