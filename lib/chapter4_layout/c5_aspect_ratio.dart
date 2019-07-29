import 'package:flutter/material.dart';
import 'package:flutter_app/widget/bottom_navigation_bar_demo.dart';
import 'package:flutter_app/widget/drawer_demo.dart';
import 'package:flutter_app/widget/listview_demo.dart';

/**
 * AspectRatio使用
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
    ;
  }
}

class Home extends StatelessWidget {
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
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 16.0 / 9.0,
          child: Container(
            color: Color.fromRGBO(3, 54, 255, 1.0),
          ),
        )
      ],
    )
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          SizedBox(
//            width: 150,
//            height: 150,
//            child: Container(
//              decoration: BoxDecoration(
//                color: Color.fromRGBO(3, 54, 255, 1.0),
//                borderRadius: BorderRadius.circular(8.0),
//              ),
//              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
//            ),
//          ),
//          SizedBox(//可以使用SizeBox空间间距
//            height: 20,
//          ),
//          SizedBox(
//            width: 150,
//            height: 150,
//            child: Container(
//              decoration: BoxDecoration(
//                color: Color.fromRGBO(3, 54, 255, 1.0),
//                borderRadius: BorderRadius.circular(8.0),
//              ),
//              child: Icon(Icons.brightness_1, color: Colors.white, size: 32.0),
//            ),
//          )
//        ],
//      ),
        );
  }
}
