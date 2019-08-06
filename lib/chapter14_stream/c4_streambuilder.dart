import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(App());

/**
 * 根据stream上的数据构建widget
 */
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StreamBroadcast'),
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

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    //throw 'something happened';
    return 'hello ~';
  }

  void _onData(String data) {
    print('_onData: $data');
  }
  void _onError(error) {
    print(error);
  }

  void _onDone() {
    print('_onDone');
  }

  void _onAdd() async {
    String data = await fetchData();
    controller.add(data);
  }

  @override
  void initState() {
    //创建streamBroadcast,可以添加多个订阅
    //stream = Stream.fromFuture(fetchData());
    controller = StreamController<String>();
    //注意：使用StreamController是不能添加listen，添加后会报错，因为StreamBuilder也会进行监听
    //如果需要多个监听，应使用StreamController<String>.broadcast()
    //subscription = controller.stream.listen(_onData, onError: _onError, onDone: _onDone);
    super.initState();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: controller.stream,
              initialData: 'StreamBuilder',
              builder: (BuildContext context, AsyncSnapshot<String> snapShot){
                return Text('${snapShot.data}');
              },
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('add'),
                  onPressed: () {
                    _onAdd();
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
