import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _StateManagementDemo(),
    );
  }
}

/**
 * 问题：
 * 由父widget管理孙子的Widget的状态,这种情况下会产生一个问题，WrapperCounter其实并不需要counter和onPressed的数据，但是因为
 * WrapperCounter是CounterWidget的父Widget，_StateManagementDemo中的状态要传递到CounterWidget中就必须经过WrapperCounter，
 * 因此可以使用InheritedWidget和ScopedModel技术对其进行优化
 *
 * 解决方案：
 * 使用InheritedWidget解决上面的问题
 */
class _StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<_StateManagementDemo> {
  int counter = 1;
  void increaseCounter(){
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConuterProvider(
      counter:counter,
      onPressed: increaseCounter,
      child: Scaffold(
        appBar: AppBar(
          title: Text('InheritedWidget'),
        ),
        body: WrapperCounter(),
        floatingActionButton: FloatingActionButton(
          onPressed: increaseCounter,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class WrapperCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterWidget();
  }
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int counter = ConuterProvider.of(context).counter;
    final VoidCallback onPressed = ConuterProvider.of(context).onPressed;

    return Center(
      child: ActionChip(label: Text('$counter'), onPressed: onPressed),
    );
  }
}

/**
 * 注意:ConuterProvider变量必须是final，初始化后就不能发生变化了，因为
 */
class ConuterProvider extends InheritedWidget {
  final int counter;
  final VoidCallback onPressed;
  final Widget child;

  ConuterProvider({this.counter, this.onPressed, this.child})
      : super(child: child);

  static ConuterProvider of(BuildContext context) => context.inheritFromWidgetOfExactType(ConuterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}
