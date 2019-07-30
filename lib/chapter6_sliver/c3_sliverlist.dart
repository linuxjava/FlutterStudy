import 'package:flutter/material.dart';

import '../model/post.dart';

///SliverPadding（内边距） 与 SliverSafeArea（安全区）
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SliverDemo(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 0, 0, 0.5),
        //Material风格中按下去背景颜色
        splashColor: Colors.blue, //Material风格中按钮水波纹颜色
      ),
    );
  }
}

class SliverDemo extends StatelessWidget {
  Widget _itemBuilder(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),//在Material中使用borderRadius无效果，因此使用ClipRRect进行裁剪
        elevation: 14,
        shadowColor: Colors.grey.withOpacity(0.5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                child: Image.network(data[index].imageUrl, fit: BoxFit.cover),
              )
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverSafeArea(
            sliver: SliverPadding(
                padding: EdgeInsets.all(8), //添加SliverGrid内边距
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(_itemBuilder,
                      childCount: data.length),
                )),
          )
        ],
      ),
    );
  }
}
