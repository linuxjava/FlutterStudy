import 'package:flutter/material.dart';

/**
 * 练习内容：Widget与Text样式基本使用
 */
void main() {
    //这里未使用material
    runApp(new MyWidget());
}

/**
 * 1.Widget基本使用
 * 2.Text基本使用
 */
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
                    fontWeight: FontWeight.bold//字体加粗
                ),
            ));
    }
}
