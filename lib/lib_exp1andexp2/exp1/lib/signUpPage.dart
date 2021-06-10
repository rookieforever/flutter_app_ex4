import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';
bool _showPassWord=false;//显示密码栏
int _radioSelected=1;//单选框
class user{
  String userName;
  String passWord;
  String nickName;//昵称
  var profile;//头像
  String gender;//性别
  int level;//等级
  String passFindQuiz;//找回密码问题
  String passFindQuizAns;//找回密码问题答案
}
var newUser =  user();
class TextFieldAndCheckPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextFieldAndCheckPageState();
}

class TextFieldAndCheckPageState extends State<TextFieldAndCheckPage> {
  //手机号的控制器
  TextEditingController phoneController = TextEditingController();
  //密码的控制器
  TextEditingController passController = TextEditingController();
  //昵称
  TextEditingController nickNameController = TextEditingController();
  //头像
  TextEditingController profileController = TextEditingController();
  //性别
  TextEditingController sexController = TextEditingController();
  //等级
  TextEditingController levelController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册界面'),
      ),
      body:new SingleChildScrollView(//使用scrollview解决底部像素溢出的问题
      child:new ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 120.0,//设定限定告诉
      ),
      child:new Column(
        children: <Widget>[
          TextField(//使用文本域构建
            controller: phoneController,
            maxLines: 1,//设定最大行数为1，下同
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
          TextField(
              controller: repassController,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                icon: Icon(Icons.lock),
                labelText: '请再次输入密码',
              ),
              obscureText: _showPassWord),
          ElevatedButton(
                onPressed: _changeState,
                child: Text('密码可见'),
              ),
          TextField(
            controller: nickNameController,
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.account_circle),
              labelText: '请输入你的昵称',
            ),
            autofocus: false,
          ),
          RadioListTile(//单选框，构建性别选项
            title:Text('男'),
            value: 1,
            groupValue: _radioSelected,
            activeColor: Colors.red,
            onChanged: (value){
              setState(() {
                _radioSelected=value;
              });
            },
            autofocus: false,
          ),
          RadioListTile(
            title:Text('女'),
            value: 2,
            groupValue: _radioSelected,
            activeColor: Colors.red,
            onChanged: (value){
              setState(() {
                _radioSelected=value;
              });
            },
            autofocus: false,
          ),
          ElevatedButton(
            onPressed: _login,
            child: Text('注册'),
          ),
        ],
      ),
    )));
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
    if (phoneController.text.length != 11) {//长度不够11位
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('用户名格式不对,需要11位'),
          ));
    }
    else if(phoneController.text.length==0)
      {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('用户名不能为空！'),
            ));
    } else if (passController.text.length == 0) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('密码不能为空！'),
          ));

    } else if (passController.text!=repassController.text) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('前后密码输入不一致！'),
          ));
    } else {

      newUser.userName=phoneController.text;
      newUser.passWord=passController.text;

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('注册成功'),
          ));
      phoneController.clear();
      passController.clear();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>loginPage()));
    }
  }

  void onTextClear() {
    setState(() {
      phoneController.clear();
      passController.clear();
    });
  }
}
