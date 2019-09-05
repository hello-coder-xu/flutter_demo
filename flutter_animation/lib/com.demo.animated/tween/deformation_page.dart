import 'package:flutter/material.dart';

///变形
class DeformationPage extends StatefulWidget {
  @override
  DeformationPageState createState() => new DeformationPageState();
}

class DeformationPageState extends State<DeformationPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<BorderRadius> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));

    BorderRadius begin = BorderRadius.all(Radius.circular(0));
    BorderRadius end = BorderRadius.all(Radius.circular(50));

    //也可以使用Tween
    animation = BorderRadiusTween(begin: begin, end: end).animate(controller)
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
        title: new Text('变形'),
        centerTitle: true,
      ),
      body: Align(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: animation.value,
            color: Colors.green,
          ),
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
