import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

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
 * 使用ScopeModel解决上面的问题
 */
class _StateManagementDemo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return ScopedModel(
            model: CounterModel(),
            child: Scaffold(
                appBar: AppBar(
                    title: Text('ScopeModel'),
                ),
                body: WrapperCounter(),
                floatingActionButton: ScopedModelDescendant<CounterModel>(builder: (context, child, model){
                    return FloatingActionButton(
                        onPressed: model.increaseCounter,
                        child: Icon(Icons.add),
                    );
                }),
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
        return ScopedModelDescendant<CounterModel>(
            builder: (context, child, model){
                return Center(
                    child: ActionChip(label: Text('${model.counter}'), onPressed: model.increaseCounter),
                );
            },
        );
    }
}

class CounterModel extends Model {
    int _counter = 0;

    int get counter => _counter;

    void increaseCounter() {
        _counter++;
        notifyListeners();
    }
}
