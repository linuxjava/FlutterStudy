import 'package:flutter/material.dart';
import 'package:flutter_app/widget/bottom_navigation_bar_demo.dart';
import 'package:flutter_app/widget/drawer_demo.dart';
import 'package:flutter_app/widget/listview_demo.dart';

/**
 * BoxDecoration 背景图片效果使用
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
            BasicDemo(),
            Icon(Icons.directions_bike, size: 128, color: Colors.blue),
          ],
        ),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //$符在字符串中引用变量
    return Container(
      //color: Colors.grey[100],
      decoration: BoxDecoration(
          image: DecorationImage(
        image:
            NetworkImage('https://resources.ninghao.org/images/candy-shop.jpg'),
        alignment: Alignment.topCenter,
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            Colors.indigoAccent[400].withOpacity(0.5), BlendMode.srcOver),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.pool,
              color: Colors.white,
            ),
            width: 90,
            height: 90,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                //设置BoxDecoration颜色
                border: Border.all(
                  //添加边框
                  color: Colors.indigoAccent[100],
                  width: 5,
                  style: BorderStyle.solid,
                ),
                //borderRadius: BorderRadius.all(Radius.circular(8)),//设置圆角
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    //设置阴影的便宜
                    color: Color.fromRGBO(16, 20, 188, 1.0),
                    //设置阴影的颜色
                    blurRadius: 20,
                    //阴影模糊半径，值也大模糊效果越明显
                    spreadRadius: 0, //阴影扩散程度，正数表示阴影扩散程度越大
                  )
                ],
                //BoxShape.circle与borderRadius无法同时使用
                shape: BoxShape.circle,
                //Radial渐变
//              gradient: RadialGradient(colors: [
//                Color.fromRGBO(7, 102, 255, 1.0),
//                Color.fromRGBO(3, 28, 128, 1.0),
//              ])
                //线性渐变(从顶部中间到底部中间渐变)
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
          ),
        ],
      ),
    );
  }
}
