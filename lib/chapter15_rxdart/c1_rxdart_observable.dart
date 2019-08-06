import 'package:flutter/material.dart';
import 'dart:async';

import 'package:rxdart/rxdart.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rxdart'),
        ),
        body: RxdartDemo(),
      ),
    );
  }
}

class RxdartDemo extends StatefulWidget {
  @override
  _RxdartDemoState createState() => _RxdartDemoState();
}

class _RxdartDemoState extends State<RxdartDemo> {

  void _onData(data){
    print(data.toString());
  }

  @override
  void initState() {
    var _observable =
    //Observable(Stream.fromIterable(['123', 'hello']));//创建方式1
    //Observable.fromIterable(['123', 'hello']);//创建方式2
    //Observable.fromFuture(Future.value('hello'));//创建方式3
    Observable.periodic(Duration(seconds: 3), (index) => debugPrint(index.toString()));//创建方式4

    _observable.listen(_onData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

