import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      home: HttpProvide(
        bloc: HttpBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Http'),
          ),
          body: CounterHome(),
          floatingActionButton: CounterFloatActionButton(),
        ),
      ),
    );
  }
}

class CounterHome extends StatefulWidget {
  @override
  _CounterHomeState createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  @override
  Widget build(BuildContext context) {
    HttpBloc bloc = HttpProvide.of(context).bloc;

    return FutureBuilder(
      future: bloc.loadData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot.data);
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Text('loading...'),
          );
        }

        return ListView(
          children: snapshot.data.map<Widget>((item) {
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class CounterFloatActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HttpBloc bloc = HttpProvide.of(context).bloc;

    return FloatingActionButton(
      onPressed: () {
        bloc.loadData();
      },
      child: Icon(Icons.add),
    );
  }
}

class HttpProvide extends InheritedWidget {
  Widget child;
  HttpBloc bloc;

  HttpProvide({this.child, this.bloc}) : super(child: child);

  static HttpProvide of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(HttpProvide);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class HttpBloc {
  Future<List<ResponseModel>> loadData() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');

    print(response.statusCode);
    if (response.statusCode == 200) {
      var bodyJson = json.decode(response.body);
      print(bodyJson);
      return bodyJson['posts']
          .map<ResponseModel>((item) => ResponseModel.fromJson(item))
          .toList();
    } else {
      throw Exception('fetch fail');
    }
  }
}

class ResponseModel {
  String title;
  String author;
  String imageUrl;

  ResponseModel(this.title, this.author, this.imageUrl);

  ResponseModel.fromJson(Map jsonData) {
    title = jsonData['title'];
    author = jsonData['author'];
    imageUrl = jsonData['imageUrl'];
  }
}
