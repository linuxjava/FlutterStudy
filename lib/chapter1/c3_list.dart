import 'package:flutter/material.dart';
import '../model/post.dart';
import '../widget/listview_demo.dart';

void main(){
    runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        theme: ThemeData(
            primarySwatch:Colors.yellow,
        ),
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
            title: Text('list使用'),
            elevation: 0,
        ),
        body: ListViewDemo(),//ListView的视图由createListItem创建
    );
  }
}

