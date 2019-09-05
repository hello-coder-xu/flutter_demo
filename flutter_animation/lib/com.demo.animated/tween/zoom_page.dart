import 'package:flutter/material.dart';

class ZoomPage extends StatefulWidget {
  @override
  ZoomPageState createState() => new ZoomPageState();
}

class ZoomPageState extends State<ZoomPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Size> animation;

//  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));

    Size begin = Size(50.0, 50.0);
    Size end = Size(200.0, 200.0);
    //也可以使用Tween
    animation = SizeTween(begin: begin, end: end).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('缩放'),
        centerTitle: true,
      ),
      body: Align(
        child: Container(
          width: animation.value.width,
          height: animation.value.height,
          color: Colors.green,
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
