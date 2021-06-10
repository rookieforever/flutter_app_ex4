

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
import 'sqlUpdate.dart';
import 'sqlSign.dart' as Sign;
bool _showPassWord=true;//显示密码栏
TextEditingController userLoginInfoController = TextEditingController();
final String mUserName = 'userName';
final String mUserPsw = 'userPsw';
//密码的控制器
var name,psw;
TextEditingController userLoginPswController = TextEditingController();
bool _checkboxSelected = true;
class sqlLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => sqlLoginPageState();
}
class sqlLoginPageState extends State<sqlLoginPage> {
  void initData(){
    if(_checkboxSelected)
    {
      Future<String>  _userInfo=getInfo();
      Future<String> _userPsw=getPsw();

      _userInfo.then((value) => _userPsw.then((String userName){
        userLoginInfoController.text=name;
        userLoginPswController.text=psw;
      }));
    }
    else{
      userLoginPswController.clear();
      userLoginInfoController.clear();
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    initData();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录信息'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextField(

            controller: userLoginInfoController,
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.phone),
              labelText: '请输入你的用户名',

            ),
            autofocus: false,
          ),
          TextField(
              controller: userLoginPswController,
              maxLines: 1,
              keyboardType: TextInputType.number,

              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                icon: Icon(Icons.lock),
                labelText: '请输入密码',
              ),
              obscureText: _showPassWord),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.blue,
                  onChanged: (value)
                  {
                    setState(() {
                      _checkboxSelected = value;
                    });
                  }
              ),
              Text("记住密码")
            ],),

          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed:(){
                    Future<int> login() async {
                      TableacctProvider testProvider = TableacctProvider();
                      var databasePath = await getDatabasesPath();
                      String path = join(databasePath, "userInfo.db");
                      await testProvider.open(path);
                      print('登录中，打开数据库..');
                      acct acctInfo = acct();
                      acctInfo.userInfo=userLoginInfoController.text;
                      acctInfo = await testProvider.getTodo(acctInfo);
                      print(acctInfo.toMap());
                      if (acctInfo.toMap()[columnuserInfo].toString() == 'null')
                      {
                        print('无效的用户名！');
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("无效的用户名！"),)
                        );
                        return 1;
                      }

                      else if (userLoginPswController.text!=
                          acctInfo.toMap()[columnuserPsw].toString())
                      {
                        print('错误的密码！');
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("错误的密码！"),)
                        );
                        return 2;
                      }

                      else {
                        save();//登录成功时，保存相应登录数据
                        if(_checkboxSelected==false)
                        {
                          userLoginPswController.clear();
                          userLoginInfoController.clear();
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>sqlUpdatePage()));
                        print('登录成功！');
                        return 3;
                      }
                    }
                    login();
//                    if (returnCount==1)
//                      ScaffoldMessenger.of(context).showSnackBar(
//                          SnackBar(content: Text(
//                              "无效的用户名！"),)
//                      );
//                    else if(returnCount==2)
//                    {
//                      ScaffoldMessenger.of(context).showSnackBar(
//                          SnackBar(content: Text(
//                              "密码错误！"),)
//                      );
//                    }
//                    else if(returnCount==3)
//                    {
//                      ScaffoldMessenger.of(context).showSnackBar(
//                          SnackBar(content: Text(
//                              "登录成功！"),)
//                      );
//                    }
                  },
                  child: Text('登录'),
                ),
              ]

          )

        ],
      ),
    );

  }
//  void _changeState(){//改变密码可见性
//    if(_showPassWord)
//    {
//      setState(() {
//        _showPassWord=false;
//      });
//      showDialog(
//          context: context,
//          builder: (context) => AlertDialog(
//            title: Text('密码已可见！'),
//          ));
//    }
//    else {
//      setState(() {
//        _showPassWord=true;
//      });
//      showDialog(
//          context: context,
//          builder: (context) => AlertDialog(
//            title: Text('密码已隐藏！'),
//          ));
//    }
//  }

  //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));


  save() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();//实例化sharedpreferences对象，进行存储
    prefs.setString(mUserName, userLoginInfoController.value.text.toString());
    prefs.setString(mUserPsw, userLoginPswController.value.text.toString());//将相应的text存储进去
  }

  Future<String> getInfo() async{
    var userName;//用于进行账号信息的存储，密码同理
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString(mUserName);
    name=userName.toString();
    return await userName;
  }
  Future<String> getPsw() async{
    var userPsw;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userPsw = prefs.getString(mUserPsw);
    psw=userPsw.toString();
    return await userPsw;
  }
}

