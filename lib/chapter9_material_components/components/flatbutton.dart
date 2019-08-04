import 'package:flutter/material.dart';

class FlatButtonDemo extends StatelessWidget {
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
            //需要通过child来实设置FlatButton的宽高，以及文字的文字
            CustomFlatButton(
                text: 'FlatButton', width: double.infinity, height: 45),
            SizedBox(height: 10,),
            CustomFlatButtonIcon(
                text: 'FlatButtonIcon', height: 50)
          ],
        ),
      ),
    );
  }
}

class CustomFlatButton extends StatelessWidget {
  String text;
  double width;
  double height;

  CustomFlatButton({this.text, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        width: width,
        height: height,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
      //color: Colors.blue,
      onPressed: () {},
      splashColor: Colors.grey, //设置溅墨效果颜色
//              shape: RoundedRectangleBorder(
//                  side: BorderSide(color: Colors.red, width: 1),
//                  borderRadius: BorderRadius.circular(8)),
    );
  }
}

class CustomFlatButtonIcon extends StatelessWidget {
  String text;
  double height;

  CustomFlatButtonIcon({this.text, this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            height: height,
            child: FlatButton.icon(
              label: Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {},
              //color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}
