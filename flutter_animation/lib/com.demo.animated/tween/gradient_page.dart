import 'package:flutter/material.dart';

///渐变
class GradientPage extends StatefulWidget {
  @override
  GradientPageState createState() => new GradientPageState();
}

class GradientPageState extends State<GradientPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));

    double begin = 0;
    double end = 1.0;
    animation = Tween<double>(begin: begin, end: end).animate(controller)
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
        title: new Text('渐变'),
        centerTitle: true,
      ),
      body: Align(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Opacity(
            opacity: animation.value,
            child: FlutterLogo(colors: Colors.red),
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
