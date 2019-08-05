import 'package:flutter/material.dart';

/**
 * Theme的使用
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
        primarySwatch: Colors.yellow, //控制主题颜色
        primaryColor: Colors.blue, //控制顶部导航栏和状态栏的颜色
        highlightColor: Color.fromRGBO(255, 0, 0, 0.5),
        //Material风格中按下去背景颜色
        splashColor: Colors.blue, //Material风格中按钮水波纹颜色
      ),
    );
    ;
  }
}

/**
 * 可以控制修改默认主题的颜色
 */
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      //1.创建一个新的Theme可以自定义主题颜色，并应用到其下面的是有widget中
      //2.如果只是想替换部分主题，可以使用Theme.of(context).copyWith
      body: Theme(
          //data: ThemeData(primaryColor: Colors.red),
          data: Theme.of(context).copyWith(
            primaryColor: Colors.red,
          ),
          child: ThemeDemo()),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(
          'Flutter',
          style: TextStyle(decoration: TextDecoration.none, fontSize: 24),
        ),
      ),
    );
  }
}
