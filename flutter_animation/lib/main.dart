import 'package:flutter/material.dart';
import 'package:flutter_animation/com.demo.animated/animated_builder/animated_builder.dart';
import 'package:flutter_animation/com.demo.animated/curved/curved_page.dart';
import 'package:flutter_animation/com.demo.animated/other/index.dart';
import 'package:flutter_animation/com.demo.animated/transition/index.dart';
import 'package:flutter_animation/com.demo.animated/tween/index.dart';

import 'package:flutter_animation/util.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
        centerTitle: true,
      ),
      body: Align(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              titleBarWidget(title: 'Flutter 动画分为补间动画(Tween)与物理动画'),
              sizedBox,
              buttonWidget(
                title: '补间动画',
                onPressed: () {
                  toPage(context, IndexPage());
                },
              ),
              sizedBox,
              buttonWidget(
                title: '物理动画',
                onPressed: () {
                  toPage(context, CurvedPage());
                },
              ),
              sizedBox,
              buttonWidget(
                title: 'AnimatedBuilder动画',
                onPressed: () {
                  toPage(context, AnimatedBuilderPage());
                },
              ),
              sizedBox,
              buttonWidget(
                title: 'Transition动画',
                onPressed: () {
                  toPage(context, TransitionPage());
                },
              ),
              sizedBox,
              buttonWidget(
                title: '常间动画',
                onPressed: () {
                  toPage(context, OtherPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toPage(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
