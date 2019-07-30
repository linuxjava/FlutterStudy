import 'package:flutter/material.dart';

/**
 * 1.tabbar的基本使用
 * 2.自定义tabbar样式
 * 3.自定义Material按钮水波纹样式
 */
void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        theme: ThemeData(
            primarySwatch:Colors.yellow,
            highlightColor: Color.fromRGBO(255, 0, 0, 0.5),//Material风格中按下去背景颜色
            splashColor: Colors.blue,//Material风格中按钮水波纹颜色
        ),
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return DefaultTabController(
          length: 3,
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                  title: Text('界面结构'),
                  leading: IconButton(//创建左边导航栏
                      icon: Icon(Icons.menu),
                      tooltip: 'Navigration',
                      onPressed: () => debugPrint('Navigration pressed')),
                  actions: <Widget>[//创建右边action
                      IconButton(
                          icon: Icon(Icons.search),
                          tooltip: 'Search',
                          onPressed: () => debugPrint('Search pressed')),
                  ],
                  bottom: TabBar(
                      unselectedLabelColor: Colors.black45,//设置未选中tab图标和文字的颜色
                      indicatorColor: Colors.black45,//选中指示器颜色
                      indicatorSize: TabBarIndicatorSize.label,//选中指示器的长度与文本一致
                      indicatorWeight: 5,//选中指示器高度
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
              body: TabBarView(children: <Widget>[
                  Icon(Icons.local_florist, size:128, color:Colors.blue),
                  Icon(Icons.change_history, size:128, color:Colors.blue),
                  Icon(Icons.directions_bike, size:128, color:Colors.blue),
              ],),
              drawer: Container(
                  color: Colors.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                          Text('this is a drawer'),
                      ],
                  ),
              ),
          ),
      );

  }

}