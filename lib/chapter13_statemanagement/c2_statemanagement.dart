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
 * 由父widget管理子Widget的状态
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
      body: CounterWidget(counter, (){
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


