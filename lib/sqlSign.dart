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
import 'sqlLogin.dart';
int accountNum=0;
TextEditingController userInfoController = TextEditingController();

TextEditingController userPswController = TextEditingController();


class sqlSignPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => sqlSignPageState();
}
class sqlSignPageState extends State<sqlSignPage> {
  //手机号的控制器


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
              title: Text('数据库注册信息'),
            ),
            body: new SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  TextField(
                    controller: userInfoController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      icon: Icon(Icons.account_circle),
                      labelText: '请输入注册用户名...',
                    ),
                    autofocus: false,
                  ),
                  TextField(
                    controller: userPswController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      icon: Icon(Icons.title),
                      labelText: '请输入注册密码...',
                    ),
                    autofocus: false, obscureText: true,
                  ),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {

                      void _sqlSignup() async {
                        String userInfo = userInfoController.text;
                        String userPsw = userPswController.text;
                        TableacctProvider testProvider = TableacctProvider();
                        var databasePath = await getDatabasesPath();
                        String path = join(databasePath, "userInfo.db");
//                    if (accountNum == 0) {
//                      await deleteDatabase(path);
//                      print('先删除数据库');
//                    }

                        await testProvider.open(path);
                        print('打开数据库..');

                        acct test1 = acct();
                        acct acctInfo = acct();
                        acctInfo.userInfo=userInfoController.text;
                        acctInfo = await testProvider.getTodo(acctInfo);
                        if (acctInfo.toMap()[columnuserInfo].toString() != 'null')
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("已被注册，请更换用户名。"),)
                          );
                          print('重复注册，返回');
                          testProvider.close();
                          return ;
                        }
                        test1.userInfo = userInfo;
                        print('存储用户名为${userInfo}');
                        test1.userPsw = userPsw;
                        print('存储账户密码为${userPsw}');
                        acct td = await testProvider.insert(test1);
                        print('inserted:${td.toMap()}');
                        // accountNum += 1;
                        testProvider.close();
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => sqlLoginPage()));
                      }
                      _sqlSignup();
                    },
                    style: ButtonStyle(),
                    child: Text('注册'),

                  )


                ],
              ),
            )));

  }
}
  final String mUserName = 'userName';
  final String mUserPsw = 'userPsw';
