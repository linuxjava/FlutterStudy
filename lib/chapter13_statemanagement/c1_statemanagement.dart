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
 * Widget内部管理自己的状态
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
      body: Center(
        child: ActionChip(label: Text('$counter'), onPressed: () {
          setState(() {
            counter++;
          });
        }),
      ),
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

