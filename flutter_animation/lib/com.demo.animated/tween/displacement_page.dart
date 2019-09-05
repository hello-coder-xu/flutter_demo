    import 'package:flutter/material.dart';

    ///位移
    class DisplacementPage extends StatefulWidget {
      @override
      DisplacementPageState createState() => DisplacementPageState();
    }

    class DisplacementPageState extends State<DisplacementPage> with SingleTickerProviderStateMixin {
      AnimationController controller;

      Animation<Offset> animation;

      @override
      void initState() {
        super.initState();

        controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));

        Offset begin = Offset(0.0, 0.0);
        Offset end = Offset(0.0, 200);
        animation = Tween<Offset>(begin: begin, end: end).animate(controller)
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
            title: Text('位移'),
            centerTitle: true,
          ),
          body: Align(
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
