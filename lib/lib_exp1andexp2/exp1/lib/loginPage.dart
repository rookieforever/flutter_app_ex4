import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signUpPage.dart' as User;
import 'package:flutterappex4/lib_exp1andexp2/tabBar.dart';
bool _showPassWord=false;//显示密码栏

class loginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => loginPageState();
}
class loginPageState extends State<loginPage> {
  //手机号的控制器
  TextEditingController phoneController = TextEditingController();

  //密码的控制器
  TextEditingController passController = TextEditingController();

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
            controller: phoneController,
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.phone),
              labelText: '请输入你的用户名',

            ),
            autofocus: false,
          ),
          TextField(
              controller: passController,
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
                onPressed: _changeState,
                child: Text('密码可见'),
              ),
              ElevatedButton(
                onPressed: _login,
                child: Text('登录'),
              ),
            ]

          )

        ],
      ),
    );
  }
  void _changeState(){//改变密码可见性
    if(_showPassWord)
    {
      setState(() {
        _showPassWord=false;
      });
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('密码已可见！'),
          ));
    }
    else {
      setState(() {
        _showPassWord=true;
      });
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('密码已隐藏！'),
          ));
    }
  }
  void _login() {
    print({'phone': phoneController.text, 'password': passController.text});
    if (phoneController.text.length != 11) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('用户手机号码格式不对,需要11位'),
          ));
    }
    else if (phoneController.text.length == 0) {
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text('用户名不能为空！'),
              ));
    } else if (passController.text.length == 0) {
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text('密码不能为空！'),
              ));
    } else if(phoneController.text!=User.newUser.userName||passController.text!=User.newUser.passWord){
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text('错误的用户名或密码，请检查输入信息！'),
              ));
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
    }
  }
}