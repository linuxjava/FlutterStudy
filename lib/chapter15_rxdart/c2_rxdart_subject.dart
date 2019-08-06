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

  void _onData1(data){
    print(data.toString());
  }

  @override
  void initState() {
    //PublishSubject使用
//    var publishSubject = PublishSubject<String>();
//    publishSubject.listen(_onData);
//    publishSubject.listen(_onData1);
//
//    publishSubject.add('hello rxdart');

    //BehaviorSubject使用(只会接收到最后一次添加的数据)
//    BehaviorSubject behaviorSubject = BehaviorSubject<String>();
//
//    behaviorSubject.add('hello rxdart');
//    behaviorSubject.add('hello flutter');
//
//    behaviorSubject.listen(_onData);
//    behaviorSubject.listen(_onData1);


    //BehaviorSubject使用(会接收到所有添加的数据)
    ReplaySubject replaySubject = ReplaySubject<String>();

    replaySubject.add('hello rxdart');
    replaySubject.add('hello flutter');

    replaySubject.listen(_onData);
    replaySubject.listen(_onData1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

