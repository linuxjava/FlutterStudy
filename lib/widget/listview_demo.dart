import 'package:flutter/material.dart';
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return ListView.builder( //创建一个ListView
            itemCount: data.length,
            itemBuilder: createListItem);
        //ListView的视图由createListItem创建;
    }

    Widget createListItem(BuildContext context, int index) {
        return Container( //创建一个容器
            child: Column(
                children: <Widget>[
                    Image.network(data[index].imageUrl),
                    SizedBox(height: 16,), //添加一个高度
                    Text(
                        data[index].title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .title, //设置文本style
                    ),
                    Text(
                        data[index].author,
                        style: Theme
                            .of(context)
                            .textTheme
                            .subhead,
                    ),
                    SizedBox(height: 16,), //添加一个高度
                ],
            ),
            color: Colors.white,
            margin: EdgeInsets.all(8),
        );
    }
}