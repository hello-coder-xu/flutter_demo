import 'package:flutter/material.dart';
import 'package:flutter_animation/util.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  const AnimatedCrossFadePage({Key key}) : super(key: key);

  @override
  _AnimatedCrossFadePageState createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSwitcher'),
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedCrossFade(
              alignment: AlignmentDirectional(0.0, 1.0),
              duration: Duration(seconds: 1),
              firstCurve: Curves.fastOutSlowIn,
              secondCurve: Curves.fastOutSlowIn,
              sizeCurve: Curves.fastOutSlowIn,
              firstChild: FlutterLogo(
                style: FlutterLogoStyle.horizontal,
                size: 100.0,
              ),
              secondChild: FlutterLogo(
                style: FlutterLogoStyle.stacked,
                size: 100.0,
              ),
              crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            ),
            buttonWidget(
              title: '切换动画',
              onPressed: () {
                _first = !_first;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
