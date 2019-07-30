import 'package:flutter/material.dart';
import 'package:flutter_app/widget/bottom_navigation_bar_demo.dart';
import 'package:flutter_app/widget/drawer_demo.dart';
import 'package:flutter_app/widget/listview_demo.dart';

/**
 * row和column布局使用
 */
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 0, 0, 0.5),
        //Material风格中按下去背景颜色
        splashColor: Colors.blue, //Material风格中按钮水波纹颜色
      ),
    );
  }
}

class Home extends StatelessWidget {
  int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('界面结构'),
          actions: <Widget>[
            //创建右边action
            IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () => debugPrint('Search pressed')),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black45,
            //设置未选中tab图标和文字的颜色
            indicatorColor: Colors.black45,
            //选中指示器颜色
            indicatorSize: TabBarIndicatorSize.label,
            //选中指示器的长度与文本一致
            indicatorWeight: 5,
            //选中指示器高度
            tabs: <Widget>[
              Tab(
                text: 'page1',
                icon: Icon(Icons.local_florist),
              ),
              Tab(
                text: 'page2',
                icon: Icon(Icons.change_history),
              ),
              Tab(
                text: 'page3',
                icon: Icon(Icons.directions_bike),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            LayoutDemo(),
            Icon(Icons.directions_bike, size: 128, color: Colors.blue),
          ],
        ),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          IconBadge(
//            Icons.pool,
//            size: 32,
//          ),
//          IconBadge(
//            Icons.beach_access,
//            size: 32,
//          ),
//          IconBadge(
//            Icons.airplanemode_active,
//            size: 32,
//          ),
//        ],
//      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,//主轴对齐方式
        crossAxisAlignment: CrossAxisAlignment.start,//交叉轴对齐方式
        children: <Widget>[
          IconBadge(
            Icons.pool,
            size: 32,
          ),
          IconBadge(
            Icons.beach_access,
            size: 64,
          ),
          IconBadge(
            Icons.airplanemode_active,
            size: 32,
          ),
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData _icon;
  final double size;

  IconBadge(this._icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Icon(_icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
