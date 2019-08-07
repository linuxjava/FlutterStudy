import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(App());

/**
 * Bloc 业务逻辑组件(Busniess logic Component)
 */
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterProvide(
        bloc: CounterBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Bloc'),
          ),
          body: CounterHome(),
          floatingActionButton: CounterFloatActionButton(),
        ),
      ),
    );
  }
}

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc bloc = CounterProvide.of(context).bloc;

    return Container(
      child: Center(
        child: ActionChip(
          label: StreamBuilder(
              initialData: bloc.counter,
              stream: bloc.contoller.stream,
              builder: (context, snapShot) {
                return Text('${bloc.counter}');
              }),
          onPressed: () {
            bloc.increase();
          },
        ),
      ),
    );
  }
}

class CounterFloatActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc bloc = CounterProvide.of(context).bloc;

    return FloatingActionButton(
      onPressed: () {
        bloc.increase();
      },
      child: Icon(Icons.add),
    );
  }
}

class CounterProvide extends InheritedWidget {
  Widget child;
  CounterBloc bloc;

  CounterProvide({this.child, this.bloc}) : super(child: child);

  static CounterProvide of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvide);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class CounterBloc {
  int counter = 0;
  StreamController contoller = StreamController<int>();

  void increase() {
    counter++;
    print('$counter');
    contoller.add(counter);
  }
}
