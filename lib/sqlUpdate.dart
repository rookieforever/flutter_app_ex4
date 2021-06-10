import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'sqlSign.dart' as Sign;

bool _showPassWord=false;//显示密码栏

class sqlUpdatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => sqlUpdatePageState();
}
class sqlUpdatePageState extends State<sqlUpdatePage> {

  TextEditingController userNewPswController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('修改密码'),
        ),
        body:new SingleChildScrollView(//使用scrollview解决底部像素溢出的问题
            child:new ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 120.0,//设定限定告诉
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  TextField(
                      controller: userNewPswController,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        icon: Icon(Icons.lock),
                        labelText: '请输入密码',
                      ),
                      obscureText: _showPassWord),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[

                        ElevatedButton(
                          onPressed:(){
                            void login() async {
                                TableacctProvider testProvider = TableacctProvider();
                                var databasePath = await getDatabasesPath();
                                String path = join(databasePath, "userInfo.db");
                                await testProvider.open(path);
                                print('修改中，进入数据库..');
                                acct acctInfo = acct();
                                acctInfo.userInfo = Sign.userInfoController.text;
                                acctInfo = await testProvider.getTodo(acctInfo);
                                acctInfo.userPsw=userNewPswController.text.toString();
                                int acctNewInfo = await testProvider.update(acctInfo);
                                print('修改后的密码为${userNewPswController.text.toString()}');
                                testProvider.close();
                            }login();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("已更新密码，请重新登录。"),)
                            );
                            Navigator.pop(context, 'Updated!');
                            },

                          child: Text('确认修改'),
                        ),
                      ]

                  )

                ],
              ),
            )
        ));

  }



}