import 'package:flutter/material.dart';

class RaisedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlatButton'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                //buttonColor: Theme.of(context).accentColor,
                buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                //矩形样式
//                  shape: BeveledRectangleBorder(
//                    borderRadius: BorderRadius.circular(10)
//                  )
                //足球场样式
//                shape: StadiumBorder()
                //圆角样式
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                )
                )
              ),
              child: RaisedButton(
                child: Text('RaisedButton'),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton.icon(
              label: Text('RaisedButtonIcon'),
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            OutlineButton(
              child: Text('OutlineButton'),
              onPressed: () {},
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 2,
                color: Colors.black
              ),
              highlightedBorderColor: Colors.grey,//设置点击时边框颜色
            ),
            SizedBox(
              height: 10,
            ),
            OutlineButton.icon(
              label: Text('OutlineButton'),
              icon: Icon(Icons.add),
              onPressed: () {},
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 2,
                  color: Colors.black
              ),
              highlightedBorderColor: Colors.red,//设置点击时边框颜色
            )
          ],
        ),
      ),
    );
  }
}
