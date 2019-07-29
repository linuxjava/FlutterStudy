import 'package:flutter/material.dart';

/**
 * 练习内容：MaterialApp：使用界面组件与定制界面主题
 */
void main() {
    //这里使用material
    runApp(new MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text('Material使用'),
                elevation: 0,//设置appBar下面的阴影
            ),
            body: MyWidget(),
        ),
        theme: ThemeData(
            primarySwatch: Colors.yellow,//设置material的主题颜色
        ),
    ));
}

class MyWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return new Center(
            child: new Text(
                'Hello Widget',
                textDirection: TextDirection.ltr,//控制显示位置
                style: TextStyle(
                    fontSize: 20,//设置字体大小
                    fontWeight: FontWeight.bold,//字体加粗
                    color: Colors.blueAccent,//字体颜色
                ),
            ));
    }
}
