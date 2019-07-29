import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarDemoState();
  }

}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo>{
    int _currentIndex = 0;

    void _onTapHandler (int index) {
        setState(() {
            _currentIndex = index;
        });
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(type: BottomNavigationBarType.fixed,
        //bottomNavigationBar如果个数超过3个其类型就会改变，导致底部导航看不到，所以需要设置type
        fixedColor: Colors.black,//激活状态下icon和text的颜色
        currentIndex: _currentIndex,//当前索引
        onTap: _onTapHandler,//item点击
        items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), title: Text('Explore')),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), title: Text('History')),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), title: Text('List')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('My')),
        ]);
  }

}