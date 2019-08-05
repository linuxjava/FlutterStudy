import 'package:flutter/material.dart';

/**
 * Text使用
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
      body:
//      ThemeDemo()
          Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black, //可以控制TextField选中状态下的颜色
              ),
              child: ThemeDemo()),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[TextFieldDemo()],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          icon: Icon(Icons.account_balance),
          labelText: 'username',
          hintText: '请输入用户名',
          //border: InputBorder.none,//去掉border
          //border: OutlineInputBorder(),//四周带边框
          filled: true,//填充背景颜色
      ),//去掉border
      onChanged: (value){debugPrint("onChanged=>$value");},
      onSubmitted: (value){debugPrint("onSubmitted=>$value");},
    );
  }
}
