import 'package:flutter/material.dart';
import 'package:flutter_animation/util.dart';

///AnimatedBuilder
class AnimatedBuilderPage extends StatefulWidget {
  @override
  AnimatedBuilderPageState createState() => AnimatedBuilderPageState();
}

class AnimatedBuilderPageState extends State<AnimatedBuilderPage> with TickerProviderStateMixin {
  AnimationController rotateController;
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

    rotateController = AnimationController(vsync: this, duration: Duration(milliseconds: 100000));
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));

    CurvedAnimation curvedRotate = CurvedAnimation(parent: rotateController, curve: Curves.linear);
    CurvedAnimation curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.linear);

    rotate = Tween<double>(begin: 0, end: 360).animate(curvedRotate)
      ..addListener(() {
        setState(() {});
      });

    translate = Tween<Offset>(begin: Offset(0, 0), end: Offset(300, 0)).animate(curvedAnimation);
    scale = Tween<double>(begin: 1, end: 2).animate(curvedAnimation);

    rotateController.repeat();
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
                title: 'AnimatedBuilder就是把动画视图跟主页面分离开了，动画执行时调用的setState只会重新绘制AnimatedBuilder中的视图，不会对主页面重新绘制'
                    '\nAnimatedBuilder的builder需要返回一个TransitionBuilder,'
                    '\n构建TransitionBuilder时可以有三种动画，'
                    '\nTransform.rotate  旋转'
                    '\nTransform.translate  移动'
                    '\nTransform.scale 缩放'),
            sizedBox,
            AnimatedBuilder(
              animation: rotateController,
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
    rotateController.dispose();
    super.dispose();
  }
}
