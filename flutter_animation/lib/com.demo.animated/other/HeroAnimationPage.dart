import 'package:flutter/material.dart';
import 'package:flutter_animation/util.dart';

///共享元素控件
class PhotoWidget extends StatelessWidget {
  final double width;
  final double height;
  final String path;

  PhotoWidget({this.width = double.infinity, this.height, this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: path,
        child: Image.asset(
          path,
          fit: BoxFit.contain,
          package: 'flutter_animation',
        ),
      ),
    );
  }
}

///共享元素
class HeroAnimationPage extends StatefulWidget {
  @override
  HeroAnimationPageState createState() => new HeroAnimationPageState();
}

class HeroAnimationPageState extends State<HeroAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('共享元素'),
        centerTitle: true,
      ),
      body: Align(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              titleBarWidget(title: 'Flutter 动画分为补间动画(Tween)与物理动画'),
              sizedBox,
              PhotoWidget(
                width: 300,
                height: 100,
                path: 'assets/images/photo.png',
              ),
              sizedBox,
              buttonWidget(
                title: '查看详情',
                onPressed: () {
                  toPage(context, PhotoDetail());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toPage(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}

///详情页面
class PhotoDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('共享元素-详情'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          PhotoWidget(
            width: double.infinity,
            height: 300,
            path: 'assets/images/photo.png',
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('\t\t\t\t蒙奇·D·路飞，日本漫画《航海王》的主角，外号“草帽”路飞，草帽海贼团、草帽大船团船长，极恶的世代之一。'
                '橡胶果实能力者，悬赏金15亿贝里。梦想是找到传说中的One Piece，成为海贼王。'
                '\n\n\t\t\t\t路飞性格积极乐观，爱憎分明，而且十分重视伙伴，不甘屈居于他人之下，对任何危险的事物都超感兴趣。'
                '和其他传统的海贼所不同的是，他并不会为了追求财富而杀戮，而是享受着身为海贼的冒险和自由。'),
          ),
        ],
      ),
    );
  }
}
