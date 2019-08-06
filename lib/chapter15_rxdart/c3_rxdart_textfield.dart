import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
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
  PublishSubject publishSubject;

  void _onData(data) {
    print(data.toString());
  }

  void _onData1(data) {
    print(data.toString());
  }

  @override
  void initState() {
    publishSubject = PublishSubject<String>();
    publishSubject
        //.map((text) => 'map: $text')//数据通过map做转换
        .where((text) => text.length > 5) //数据的长度必须大于5才可以输出
        .debounce(Duration(
            milliseconds:
                500)) //如果用户一直输入那么是不会输出的，只有用户停止输入，然后500毫秒后，会输出TextField中内容
        .listen(_onData);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextField(
            decoration:
                InputDecoration(labelText: 'rxdart', icon: Icon(Icons.ac_unit)),
            onChanged: (text) {
              publishSubject.add('$text');
            },
            onSubmitted: (text) {
              publishSubject.add('$text');
            },
          )
        ],
      ),
    );
  }
}
