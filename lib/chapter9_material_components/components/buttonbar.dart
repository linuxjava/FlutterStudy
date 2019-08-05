import 'package:flutter/material.dart';

class ButtonBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonBar'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                    buttonTheme: ButtonThemeData(
                      padding: EdgeInsets.symmetric(horizontal: 8),//设置ButtonBar水平排列的widget间元素的间隔
                    )
                  ),
                  child: ButtonBar(
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Button1'),
                        onPressed: () {},
                      ),
                      RaisedButton(
                        child: Text('Button1'),
                        onPressed: () {},
                      ),
                      RaisedButton(
                        child: Text('Button1'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
