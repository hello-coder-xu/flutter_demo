import 'package:flutter/material.dart';
import 'package:flutter_animation/com.demo.animated/other/AnimatedListPage.dart';
import 'package:flutter_animation/com.demo.animated/other/AnimatedCrossFadePage.dart';
import 'package:flutter_animation/com.demo.animated/other/HeroAnimationPage.dart';
import 'package:flutter_animation/util.dart';

///常间动画
class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('常间动画'),
        centerTitle: true,
      ),
      body: Align(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              titleBarWidget(title: 'Flutter 动画分为补间动画(Tween)与物理动画'),
              sizedBox,
              buttonWidget(
                title: '列表动画',
                onPressed: () {
                  toPage(context, AnimatedListPage());
                },
              ),
              sizedBox,
              buttonWidget(
                title: '切换动画',
                onPressed: () {
                  toPage(context, AnimatedCrossFadePage());
                },
              ),
              sizedBox,
              buttonWidget(
                title: '共享元素动画',
                onPressed: () {
                  toPage(context, HeroAnimationPage());
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
