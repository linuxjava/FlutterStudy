import 'package:flutter/material.dart';

class BottomAppBarDemo extends StatelessWidget {
    Widget _floatingActionButton() {
        return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
                debugPrint('onPressed');
            },
            elevation: 0,
        );
    }

    /**
     * 通过设置floatingActionButtonLocation与shape属性可以控制BottomAppBar与FloatingActionButton的组合
     */
    Widget _bottomNavigationBar(){
        return BottomAppBar(
            child: Container(
                height: 80,
            ),
            shape: CircularNotchedRectangle(),
        );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('BottomAppBar'),
        ),
        floatingActionButton: _floatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _bottomNavigationBar(),
        body: Container(
            color: Colors.brown[50],
        ),
    );
  }
}
