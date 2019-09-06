import 'package:flutter/material.dart';
import 'package:flutter_animation/util.dart';
import 'dart:math' as math;

///AnimatedBuilder
class AnimatedBuilderPage extends StatefulWidget {
  @override
  AnimatedBuilderPageState createState() => AnimatedBuilderPageState();
}

class AnimatedBuilderPageState extends State<AnimatedBuilderPage> with SingleTickerProviderStateMixin {
  AnimationController controller;

  //旋转
  Animation<double> rotate;

  //移动
  Animation<Offset> translate;

  //缩放
  Animation<double> scale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));

    CurvedAnimation curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.linear);

    rotate = Tween<double>(begin: 0, end: math.pi * 2).animate(curvedAnimation);
    translate = Tween<Offset>(begin: Offset(0, 0), end: Offset(300, 50)).animate(curvedAnimation);
    scale = Tween<double>(begin: 1, end: 2).animate(curvedAnimation);

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilder'),
        centerTitle: true,
      ),
      body: Align(
        child: Column(
          children: <Widget>[
            titleBarWidget(
                title: 'AnimatedBuilder就是把动画视图跟主页面分离开了，动画执行时不会对主页面重新绘制'
                    '\nAnimatedBuilder的builder需要返回一个TransitionBuilder,'
                    '\n构建TransitionBuilder时可以有三种动画，'
                    '\nTransform.rotate  旋转'
                    '\nTransform.translate  移动'
                    '\nTransform.scale 缩放'),
            sizedBox,
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: rotate.value,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                    child: Icon(Icons.android, color: Colors.white),
                  ),
                );
              },
            ),
            sizedBox,
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: translate.value,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                    child: Icon(Icons.android, color: Colors.white),
                  ),
                );
              },
            ),
            sizedBox,
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: scale.value,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                    child: Icon(Icons.android, color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
