import 'package:flutter/material.dart';
import 'package:flutter_animation/util.dart';

///Transition
class TransitionPage extends StatefulWidget {
  @override
  TransitionPageState createState() => new TransitionPageState();
}

class TransitionPageState extends State<TransitionPage> with SingleTickerProviderStateMixin {
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

    //加入曲线模型
    CurvedAnimation curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.linear);

    rotate = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    translate = Tween<Offset>(begin: Offset(0, 0), end: Offset(1.5, 1.5)).animate(curvedAnimation);
    scale = Tween<double>(begin: 1, end: 2).animate(curvedAnimation);

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transition'),
        centerTitle: true,
      ),
      body: Align(
        child: Column(
          children: <Widget>[
            titleBarWidget(title: 'Transition 继承AnimatedWidget'),
            sizedBox,
            RotationTransition(
              turns: rotate,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Icon(Icons.android, color: Colors.white),
              ),
            ),
            sizedBox,
            SlideTransition(
              position: translate,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Icon(Icons.android, color: Colors.white),
              ),
            ),
            sizedBox,
            ScaleTransition(
              scale: scale,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Icon(Icons.android, color: Colors.white),
              ),
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
