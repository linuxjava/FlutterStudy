import 'package:flutter/material.dart';

import '../model/post.dart';

///SliverAppBar使用
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
          borderRadius: BorderRadius.circular(12.0),
          //在Material中使用borderRadius无效果，因此使用ClipRRect进行裁剪
          elevation: 14,
          shadowColor: Colors.grey.withOpacity(0.5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  child: Image.network(data[index].imageUrl, fit: BoxFit.cover),
                )),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //title: Text('Flutter',),
            //pinned: true,//设置SliverAppBar为固定的，默认SliverAppBar是可滚动的
            floating: true,
            expandedHeight: 178,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Flutter',
                style: TextStyle(fontSize: 16, letterSpacing: 3, fontWeight: FontWeight.w400),
              ),
              background: Image.network('https://resources.ninghao.org/images/childhood-in-a-picture.jpg',fit: BoxFit.cover,),
            ),
          ),
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
