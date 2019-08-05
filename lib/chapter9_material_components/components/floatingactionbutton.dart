import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  Widget _floatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        debugPrint('onPressed');
      },
      elevation: 0,
      backgroundColor: Colors.grey[800],
      shape: BeveledRectangleBorder(
          //borderRadius: BorderRadius.circular(10)
          borderRadius: BorderRadius.circular(30)),
    );
  }

  Widget _floatingActionButtonExtended() {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: Text('Add'),
      icon: Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButton'),
        elevation: 0.0,
      ),
      //floatingActionButton: _floatingActionButton(),
      floatingActionButton: _floatingActionButtonExtended(),
    );
  }
}
