import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StreamController'),
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
  //Stream<String> stream;
  StreamController<String> controller;//使用controller添加数据
  StreamSubscription<String> subscription;
  Sink<String> sink;

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    //throw 'something happened';
    return 'hello ~';
  }

  void _onData(String data) {
    print(data);
  }

  void _onError(error) {
    print(error);
  }

  void _onDone() {
    print('_onDone');
  }

  void _onAdd() async {
    String data = await fetchData();
    //controller.add(data);
    sink.add(data);//也可以使用sink添加数据
  }

  @override
  void initState() {
    //创建stream
    //stream = Stream.fromFuture(fetchData());
    controller = StreamController<String>();
    sink = controller.sink;
    //监听stream的数据
    subscription =
        controller.stream.listen(_onData, onError: _onError, onDone: _onDone);
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('add'),
                  onPressed: () {
                    _onAdd();
                  },
                ),
                RaisedButton(
                  child: Text('pasuse'),
                  onPressed: () {
                    subscription.pause();
                  },
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('resume'),
                  onPressed: () {
                    subscription.resume();
                  },
                ),
                RaisedButton(
                  child: Text('cancel'),
                  onPressed: () {
                    subscription.cancel();
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
