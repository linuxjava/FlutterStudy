import 'package:flutter/material.dart';

/**
 * form表单使用
 */
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.yellow, //控制主题颜色
      ),
    );
    ;
  }
}

/**
 * 可以控制修改默认主题的颜色
 */
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      //1.创建一个新的Theme可以自定义主题颜色，并应用到其下面的是有widget中
      //2.如果只是想替换部分主题，可以使用Theme.of(context).copyWith
      body:
          Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.blue, //可以控制TextField选中状态下的颜色
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: FormDemo(),
              )),
    );
  }
}

class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final globalKey = GlobalKey<FormState>();
  String username;
  String password;
  bool autovalidate = false;

  void register(){
    if(globalKey.currentState.validate()) {
      globalKey.currentState.save();
      debugPrint("$username $password");

      Scaffold.of(context).showSnackBar(SnackBar(content: Text('正在注册...')));
    }else{
      setState(() {
        autovalidate = true;
      });
    }
  }

  String _validatorUsername(String value){
    if(value.isEmpty){
      return 'Username is required';
    }

    return null;
  }

  String _validatorPassword(String value){
    if(value.isEmpty){
      return 'Username is required';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Username',helperText: ''),
            onSaved: (value){
              username = value;
            },
            validator: _validatorUsername,
            autovalidate: autovalidate,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password',helperText: ''),
            onSaved: (value){
              password = value;
            },
            validator: _validatorPassword,
            autovalidate: autovalidate,
          ),
          SizedBox(height: 32,),
          Container(
            width: double.infinity,
            child: RaisedButton(
              //注意必须要设置onPressed，否则显示的颜色一直为不可点击状态，即使你设置了color
              color: Theme.of(context).primaryColor,
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: register,
            ),
          )
        ],
      ),
    );
  }
}
