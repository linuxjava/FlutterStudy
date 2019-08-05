import 'package:flutter/material.dart';

class PopMenuButtonDemo extends StatefulWidget {
  @override
  _PopMenuButtonDemoState createState() => _PopMenuButtonDemoState();
}

class _PopMenuButtonDemoState extends State<PopMenuButtonDemo> {
  String _itemValue = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopMenuButton'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Text(_itemValue),
            PopupMenuButton(
                onSelected: (value) {
                  setState(() {
                    _itemValue = value;
                  });
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 'Home',
                      child: Text('Home'),
                    ),
                    PopupMenuItem(
                      value: 'Discover',
                      child: Text('Discover'),
                    ),
                    PopupMenuItem(
                      value: 'Text',
                      child: Text('Text'),
                    ),
                  ];
                })
          ],
        ),
      ),
    );
  }
}
