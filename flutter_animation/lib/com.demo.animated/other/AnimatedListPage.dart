import 'package:flutter/material.dart';

///列表动画
class AnimatedListPage extends StatefulWidget {
  @override
  AnimatedListPageState createState() => AnimatedListPageState();
}

class AnimatedListPageState extends State<AnimatedListPage> {
  final GlobalKey<AnimatedListState> globalKey = GlobalKey<AnimatedListState>();
  int index = 5;

  int type = 1;

  ///item视图
  Widget itemWidget({context, animation, index}) {
    Widget child = Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.only(left: 16, top: 16, right: 16),
      color: Colors.primaries[index],
    );
    Widget size = SizeTransition(sizeFactor: animation, child: child);
    Widget scale = ScaleTransition(scale: animation, child: child);
    Widget fade = FadeTransition(opacity: animation, child: child);

    switch (type) {
      case 1:
        return size;
      case 2:
        return scale;
      case 3:
        return fade;
      default:
        return size;
    }
  }

  ///构建 视图
  Widget buildItemWidget(context, index, animation) {
    return itemWidget(context: context, index: index, animation: animation);
  }

  ///删除视图
  Widget removeItemBuilder(BuildContext context, Animation<double> animation) {
    return itemWidget(context: context, index: index, animation: animation);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedList'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () {
              index += 1;
              globalKey.currentState.insertItem(index - 1);
            },
          ),
          IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: () {
              if (index > 1) {
                index -= 1;
                globalKey.currentState.removeItem(index, removeItemBuilder);
              }
            },
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('展开收起'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('放大缩小'),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text('渐变'),
                  value: 3,
                ),
              ];
            },
            onSelected: (value) {
              type = value;
              setState(() {});
            },
          ),
        ],
      ),
      body: AnimatedList(
        key: globalKey,
        itemBuilder: buildItemWidget,
        initialItemCount: index,
      ),
    );
  }
}
