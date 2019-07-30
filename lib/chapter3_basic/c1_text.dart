import 'package:flutter/material.dart';
import 'package:flutter_app/widget/bottom_navigation_bar_demo.dart';
import 'package:flutter_app/widget/drawer_demo.dart';
import 'package:flutter_app/widget/listview_demo.dart';

/**
 * Text：文字与文字样式
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
            BasicDemo(),
            Icon(Icons.directions_bike, size: 128, color: Colors.blue),
          ],
        ),
        drawer: DrawerDemo(),
        bottomNavigationBar:BottomNavigationBarDemo(),
      ),
    );
  }
}

class BasicDemo extends StatelessWidget {
  //下划线命名表示变量是class内部私有的
  TextStyle _textStyle = TextStyle(
    fontSize: 20,
  );
  String _author = '李白';
  String _title = '将进酒';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //$符在字符串中引用变量
    return Text(
      '《$_title》——$_author。君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。与君歌一曲，请君为我倾耳听。钟鼓馔玉不足贵，但愿长醉不复醒。古来圣贤皆寂寞，惟有饮者留其名。陈王昔时宴平乐，斗酒十千恣欢谑。主人何为言少钱，径须沽取对君酌。五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。',
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 3,//设置最大行数
      overflow: TextOverflow.ellipsis,//超出最大行数使用...显示
    );
  }

}
