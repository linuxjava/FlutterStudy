import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: _StateManagementDemo(),
    );
  }
}

/**
 * 由父widget管理孙子的Widget的状态,这种情况下会产生一个问题，WrapperCounter其实并不需要counter和onPressed的数据，但是因为
 * WrapperCounter是CounterWidget的父Widget，_StateManagementDemo中的状态要传递到CounterWidget中就必须经过WrapperCounter，
 * 因此可以使用InheritedWidget和ScopedModel技术对其进行优化
 *
 * 核心问题就是视图与数据状态耦合了，所以需要状态管理技术来解决这样的问题：
 * 1.InheritedWidget
 * 2.ScopeModel
 */
class _StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<_StateManagementDemo> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagement'),
      ),
      body: WrapperCounter(counter, (){
        setState(() {
          counter++;
        });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class WrapperCounter extends StatelessWidget {
  final int counter;
  final VoidCallback onPressed;

  WrapperCounter(this.counter, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return CounterWidget(counter, onPressed);
  }
}

class CounterWidget extends StatelessWidget {
  final int counter;
  final VoidCallback onPressed;

  CounterWidget(this.counter, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(label: Text('$counter'), onPressed: onPressed
      ),
    );
  }
}


