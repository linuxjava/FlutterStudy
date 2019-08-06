import 'package:flutter/material.dart';
import 'dart:async';

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
          title: Text('Stream'),
        ),
        body: StreamDemo(),
      ),
    );
  }
}

class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  Stream<String> stream;
  StreamSubscription<String> subscription;

  Future<String> fetchData() async{
    await Future.delayed(Duration(seconds: 5));
    //throw 'something happened';
    return 'hello ~';
  }

  void _onData(String data){
    print(data);
  }

  void _onError(error){
    print(error);
  }

  void _onDone(){
    print('_onDone');
  }

  @override
  void initState() {
    //创建stream
    stream = Stream.fromFuture(fetchData());
    //监听stream的数据
    subscription = stream.listen(_onData, onError: _onError, onDone: _onDone);
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ButtonBar(
        children: <Widget>[
          RaisedButton(
            child: Text('pasuse'),
            onPressed: (){
              subscription.pause();
            },
          ),
          RaisedButton(
            child: Text('resume'),
            onPressed: (){
              subscription.resume();
            },
          ),
          RaisedButton(
            child: Text('cancel'),
            onPressed: (){
              subscription.cancel();
            },
          ),
        ],
      ),
    );
  }
}

