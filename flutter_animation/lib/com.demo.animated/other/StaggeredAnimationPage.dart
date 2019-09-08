import 'package:flutter/material.dart';

///交错动画
class StaggeredAnimationPage extends StatefulWidget {
  @override
  StaggeredAnimationPageState createState() => StaggeredAnimationPageState();
}

class StaggeredAnimationPageState extends State<StaggeredAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> translate;
  Animation<double> sizeWidth;
  Animation<double> sizeHeight;
  Animation<double> radius;
  Animation<Color> color;
  Animation<double> opacity;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    translate = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 200)).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.3, curve: Curves.linear),
      ),
    );

    sizeWidth = Tween<double>(begin: 50, end: 200).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.3, 0.4, curve: Curves.linear),
    ));
    sizeHeight = Tween<double>(begin: 50, end: 200).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.4, 0.6, curve: Curves.linear),
    ));
    radius = Tween<double>(begin: 0, end: 100).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.6, 0.7, curve: Curves.linear),
    ));
    color = ColorTween(begin: Colors.green, end: Colors.red)
        .animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.6, 0.8, curve: Curves.bounceOut),
    ));

    opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.8, 1.0, curve: Curves.linear),
    ));

    controller.addStatusListener((AnimationStatus status) {
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
        title: Text('交错动画'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.translate(
              offset: translate.value,
              child: Container(
                width: sizeWidth.value,
                height: sizeHeight.value,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(radius.value)),
                  color: color.value,
                ),
                child: Opacity(
                  opacity: opacity.value,
                  child: Icon(
                    Icons.android,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
