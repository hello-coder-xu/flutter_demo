import 'package:flutter/material.dart';
import 'package:flutter_animation/com.demo.animated/tween/color_page.dart';
import 'package:flutter_animation/com.demo.animated/tween/combination_page.dart';
import 'package:flutter_animation/com.demo.animated/tween/deformation_page.dart';
import 'package:flutter_animation/com.demo.animated/tween/displacement_page.dart';
import 'package:flutter_animation/com.demo.animated/tween/gradient_page.dart';
import 'package:flutter_animation/com.demo.animated/tween/zoom_page.dart';
import 'package:flutter_animation/util.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween动画'),
        centerTitle: true,
      ),
      body: Align(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              titleBarWidget(title: '基于Tween简单展示样例，没有AnimatedBuilder,使用时会整个页面都会重新绘制'),
              sizedBox,
              buttonWidget(
                title: '缩放',
                onPressed: () {
                  toPage(context, ZoomPage());
                },
              ),
              sizedBox,
              buttonWidget(
                title: '移动',
                onPressed: () {
                  toPage(context, DisplacementPage());
                },
              ),
              sizedBox,
              buttonWidget(
                title: '变形',
                onPressed: () {
                  toPage(context, DeformationPage());
                },
              ),
              sizedBox,
              buttonWidget(
                title: '渐变',
                onPressed: () {
                  toPage(context, GradientPage());
                },
              ),
              sizedBox,
              buttonWidget(
                title: '色变',
                onPressed: () {
                  toPage(context, ColorPage());
                },
              ),
              sizedBox,
              buttonWidget(
                title: '组合',
                onPressed: () {
                  toPage(context, CombinationPage());
                },
              ),
              sizedBox,
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