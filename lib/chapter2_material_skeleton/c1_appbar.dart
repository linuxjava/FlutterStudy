import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        theme: ThemeData(
            primarySwatch:Colors.yellow,
        ),
    );;
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('123'),
            leading: IconButton(//创建左边导航栏
                icon: Icon(Icons.menu),
                tooltip: 'Navigration',
                onPressed: () => debugPrint('Navigration pressed')),
            actions: <Widget>[//创建右边action
                IconButton(
                    icon: Icon(Icons.search),
                    tooltip: 'Search',
                    onPressed: () => debugPrint('Search pressed')),
            ],
        ),

        body: null,
    );
  }

}