import 'package:flutter/material.dart';
import 'tabBar.dart';
class News{
  final String  title;//标题
  final String description;//描述
  final String picUrl;//图像链接
  var id;
  var ctime;
  var type;
  var url;
  News(this.title,this.description,this.picUrl);//构造函数,final类型必须在此确定
}

class detailPageState extends StatelessWidget{
  final News news;
  detailPageState({Key key, @required this.news}) : super(key: key);//构造该类时，需要news这个参数，即必须得到在构造函数的信息（标题、内容等）
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${news.title}'),//使用$加{}的形式表示变量，下同
//          leading:IconButton(
//            icon: Icon(Icons.keyboard_arrow_left),
//          )
      ),
      body: Column(
        children: <Widget>[
          Image.network(
            '${news.picUrl}',width: 400,
            height: 300),
          Text('${news.description}'),
        ],
      ),
    );
  }
}