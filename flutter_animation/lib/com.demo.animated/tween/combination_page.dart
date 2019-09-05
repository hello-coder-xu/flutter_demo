import 'package:flutter/material.dart';

///组合
class CombinationPage extends StatefulWidget {
  @override
  CombinationPageState createState() => new CombinationPageState();
}

class CombinationPageState extends State<CombinationPage> with SingleTickerProviderStateMixin {
  AnimationController controller;

  //位移
  Animation<double> displacement;

  //色变
  Animation<Color> color;

  //变形
  Animation<double> deformation;

  //缩放
  Animation<double> zoom;

  Animation<double> gradient;

  AnimationStatusListener animationStatusListener;
  VoidCallback voidCallback;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));

    voidCallback = () {
      setState(() {});
    };
    animationStatusListener = (AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    };

    displacement = Tween<double>(begin: 0, end: 200).animate(controller)
      ..addListener(voidCallback)
      ..addStatusListener(animationStatusListener);

    color = ColorTween(begin: Colors.green, end: Colors.red).animate(controller);

    deformation = Tween<double>(begin: 0, end: 50).animate(controller);

    zoom = Tween<double>(begin: 50, end: 300).animate(controller);

    gradient = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('组合'),
        centerTitle: true,
      ),
      body: Align(
        child: Container(
          width: zoom.value,
          height: zoom.value,
          margin: EdgeInsets.only(top: displacement.value),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(deformation.value)),
            color: color.value,
          ),
          child: Opacity(
            opacity: gradient.value,
            child: Icon(
              Icons.android,
              color: Colors.white,
            ),
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
