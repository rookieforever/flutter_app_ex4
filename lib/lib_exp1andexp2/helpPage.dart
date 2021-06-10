import 'package:flutter/material.dart';
import 'tabBar.dart';
class helpPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>helpPageState();
}
class helpPageState extends State<helpPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('帮助文档'),
//          leading:IconButton(
//            icon: Icon(Icons.keyboard_arrow_left),
//
//          )
      ),
      body: Column(
      children: <Widget>[
        Text('使用Listview构建了新闻浏览器的布局，添加子Widget为ListTile，修改ListTile的样式得到新闻布局，并添加相关参数和图片；使用GridView和ListView构建个人用户界面。'),
      ],
      ),
    );
  }
}