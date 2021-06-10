import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DemoApp());
}
_querySQLHelper() async{
//  TableTestProvider testProvider = TableTestProvider();
//  var databasePath = await getDatabasesPath();
//  String path = join(databasePath,"demo1.db");
//  await deleteDatabase(path);
//  print('先删除数据库');
//  await testProvider.open(path);
//  print('重新创建数据库');
//  Test test1 = Test();
//  test1.id =1;
//  test1.title='Hello World';
//  test1.done=false;
//  Test td = await testProvider.insert(test1);
//  print('inserted:${td.toMap()}');
//  Test test2 = Test();
//  test2.id = 2;
//  test2.title="Hello World2";
//  test2.done = false;
//  Test td2 = await testProvider.insert(test2);
//  print('inserted:${td2.toMap()}');
//  test2.title='Big big world';
//  int u = await testProvider.update(test2);
//  print("update:$u");
//  int d = await testProvider.delete(1);
//  print("delete:$d");
//  Test dd = await testProvider.getTodo(2);
//  print("todo:${dd.toMap()}");
//  testProvider.close();
}
class MyApp extends StatelessWidget {
  final String mUserName = 'userName';
  final _userNameController = new TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    save() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(mUserName, _userNameController.value.text.toString());
    }
    Future<String> get() async{
      var userName;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userName = prefs.getString(mUserName);
      return userName;
    }
    return new Builder(builder: (BuildContext context){
      return new MaterialApp(
        home:       Scaffold(
          appBar: AppBar(
            title: Text('SharedPreferences'),
          ),
          body: Center(
            child: new Builder(builder: (BuildContext context) {
              return
                Column(
                  children: <Widget>[
                    TextField(
                      controller: _userNameController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 10.0),
                          icon: Icon(Icons.perm_identity),
                          labelText: "请输入用户名",
                          helperText: "注册时使用的名字"),
                    ),
                    ElevatedButton(
                        child: Text("存储"),
                        onPressed: (){
                          save();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("数据存储成功！"),)
                          );
                        }),
                    ElevatedButton(
                        child: Text("获取"),
                        onPressed:(){
                          Future<String> userName = get();
                          userName.then((String userName){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("数据获取成功:$userName"),)
                            );
                          });
                        }),

                  ],
                );
            }),
          ),
        ),
      );

    });
  }
}
class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sqlite Demo',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataBase Operation"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Start Operation"),
          onPressed: (){
            Fluttertoast.showToast(msg: "DataBase Opearation",textColor: Colors.black);
            _querySQLHelper();
          },
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
