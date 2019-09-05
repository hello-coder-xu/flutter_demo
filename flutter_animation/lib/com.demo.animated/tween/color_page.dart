import 'package:flutter/material.dart';

///色变
class ColorPage extends StatefulWidget {
  @override
  ColorPageState createState() => ColorPageState();
}

class ColorPageState extends State<ColorPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Color> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));

    Color begin = Colors.red;
    Color end = Colors.cyan;
    animation = ColorTween(begin: begin, end: end).animate(controller)
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
    return Scaffold(
      appBar: AppBar(
        title: Text('色变'),
        centerTitle: true,
      ),
      body: Align(
        child: Container(
          width: 100,
          height: 100,
          color: animation.value,
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
