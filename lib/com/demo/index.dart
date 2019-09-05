import 'package:flutter/material.dart';

import 'package:flutter_animation/util.dart';
import 'package:flutter_animation/main.dart';

class Index extends StatefulWidget {
  @override
  IndexState createState() => IndexState();
}

class IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          children: <Widget>[
            titleBarWidget(title: '相关demo'),
            SizedBox(height: 40),
            buttonWidget(
              title: '动画',
              onPressed: () {
                toPage(AnimationDemo());
              },
            ),
          ],
        ),
      ),
    );
  }

  void toPage(Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
