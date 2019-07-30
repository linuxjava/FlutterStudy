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
    return Container(
      child: Image.network(data[index].imageUrl, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverSafeArea(
                sliver: SliverPadding(
                    padding: EdgeInsets.all(8), //添加SliverGrid内边距
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1.5 //设置item宽高比例
                          ),
                      delegate: SliverChildBuilderDelegate(_itemBuilder,
                          childCount: data.length),
                    )
                ),
              )
            ],
          ),
        ));
  }
}
