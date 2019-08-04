import 'package:flutter/material.dart';

import 'components/floatingactionbutton.dart';
import 'components/bottomappbar.dart';
import 'components/flatbutton.dart';
import 'components/raisedbutton.dart';
import 'components/container.dart';
import 'components/buttonbar.dart';
import 'components/popmenubutton.dart';

/**
 * Material组件的使用
 */
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, //控制主题颜色
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material组件'),
        elevation: 0.0,
      ),
      body: MaterialComponentDemo(),
    );
  }
}

class MaterialComponentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListItem(
            title: 'FloatingActionButton', page: FloatingActionButtonDemo()),
        ListItem(
            title: 'BottomAppBar', page: BottomAppBarDemo()),
        ListItem(
            title: 'FlatButton', page: FlatButtonDemo()),
        ListItem(
            title: 'RaisedButton&OutlineButton', page: RaisedButtonDemo()),
        ListItem(
            title: 'Container&Expanded', page: ContainerDemo()),
        ListItem(
            title: 'Buttonbar', page: ButtonBarDemo()),
        ListItem(
            title: 'PopMenuButton', page: PopMenuButtonDemo()),
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  String title;
  Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
