import 'package:flutter/material.dart';

///曲线运动
class CurvedPage extends StatefulWidget {
  @override
  CurvedPageState createState() => new CurvedPageState();
}

class CurvedPageState extends State<CurvedPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));

    Offset begin = Offset(0.0, 0.0);
    Offset end = Offset(0.0, 600);

    CurvedAnimation curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation = Tween<Offset>(begin: begin, end: end).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('自由落体'),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(top: animation.value.dy),
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
