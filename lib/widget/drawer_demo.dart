import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        child: ListView(
            children: <Widget>[
                UserAccountsDrawerHeader(
                    accountName: Text('xiaoguochang'),
                    accountEmail: Text('123456789@qq.com'),
                    currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://resources.ninghao.org/images/wanghao.jpg'),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.yellow[400],
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://resources.ninghao.org/images/childhood-in-a-picture.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.yellow[400].withOpacity(0.6),
                                BlendMode.hardLight))),
                ),
                ListTile(
                    title: Text('Messages', textAlign: TextAlign.right),
                    trailing: Icon(
                        Icons.message,
                        size: 22,
                        color: Colors.black12,
                    ),
                    onTap: () => Navigator.pop(context),
                ),
                ListTile(
                    title: Text('Favorite', textAlign: TextAlign.right),
                    trailing: Icon(
                        Icons.favorite,
                        size: 22,
                        color: Colors.black12,
                    ),
                    onTap: () => Navigator.pop(context),
                ),
                ListTile(
                    title: Text('Setting', textAlign: TextAlign.right),
                    trailing: Icon(
                        Icons.settings,
                        size: 22,
                        color: Colors.black12,
                    ),
                    onTap: () => Navigator.pop(context),
                ),
            ],
        ),
    );
  }

}