import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'News.dart';
import 'dart:convert';
import 'NewsDetail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutterappex4/newsData.dart';
List<News> newsDatas=[];
List<News> offLineDatas=[];

Future <News> readDataStore(int nums) async {
  TablenewsDataProvider testProvider = TablenewsDataProvider();
  var databasePath = await getDatabasesPath();
  String path = join(databasePath, "NewsInfo.db");
  await testProvider.open(path);
  News tmptd = News();//返回暂时的新闻数据
  print('打开数据库..');
  // for(int i=1;i<10;i++)
  //   {
  //     newsData data =newsData();
  //     data=await testProvider.getTodo(i);
  //     print('GotNewsData:${data.toMap()}');
  //   }
  newsData data =newsData();
  data=await testProvider.getTodo(nums);
  tmptd.code=data.code;
  tmptd.ctime=data.ctime;
  tmptd.description=data.description;
  tmptd.msg=data.msg;
  tmptd.title=data.title;
  tmptd.picUrl=data.picUrl;
  tmptd.url=data.url;
  print('GotNewsData:${data.toMap()}');
  if(nums==9)
  {
    testProvider.close();print("关闭数据库...");//当执行到第9个时，关闭数据库以防溢出
  }
  return tmptd;
}
class newsByApi extends StatefulWidget {
  @override
  _newsByApiState createState() => _newsByApiState();
}
int pageIndex=1;//翻页数，用于刷新
Future<List<News>>getDatas()async{
  final response=await http.get(Uri.parse(
      "http://api.tianapi.com/generalnews/index?key=2d356e7ab83513e2f8654cc8dcc60b79&num=10&page=${pageIndex}"));
  pageIndex+=1;
  Utf8Decoder decode=new Utf8Decoder();
  Map<String, dynamic> result=jsonDecode(decode.convert(response.bodyBytes));
  //print(result);
  List<News> datas;
  datas= result['newslist'].map<News>((item)=> News.fromJson(item)).toList();
  return datas;
}
class _newsByApiState extends State<newsByApi> {

  bool _cancelConnect=false;

  void initState()
  {

    for(int i=1;i<10;i++){
      readDataStore(i).then((value){
        setState(() {
          offLineDatas.insert(i-1,value);
        });
      });
      newsDatas=offLineDatas;
    }

    getDatas().then((List<News> datas) {
      if(!_cancelConnect)

      {
        setState(() {

          if(datas!=null){
            print("有网络，获取在线数据");
            newsDatas=datas;
          }

        });
      }
    }).catchError((e) {

      print('获取数据出错！${e}');
    }).whenComplete((){
      print('新闻获取完毕');
    }).timeout(Duration(seconds: 5)).catchError((timeOut){
      print('超时:${timeOut}');
      _cancelConnect=true;
    });
  }
  Future _pullrefresh() async{
    newsDatas.clear();
    getDatas().then((List<News> datas) {
      if(!_cancelConnect)
      {
        setState(() {
          newsDatas=datas;
        });
      }
    }).catchError((e){
      print('获取数据出错！${e}');
    }).whenComplete((){
      print('新闻获取完毕');
    }).timeout(Duration(seconds: 5)).catchError((timeOut){
      print('超时:${timeOut}');
      _cancelConnect=true;
    });
  }
  void _newsDataStore() async {
    TablenewsDataProvider testProvider = TablenewsDataProvider();
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, "NewsInfo.db");
    if (pageIndex >= 0) {
      await deleteDatabase(path);
      print('先删除数据库');
    }//只进行前10条数据的存储，在有数据库的情况下删除原有数据库
    await testProvider.open(path);
    print('打开数据库..');
    if(newsDatas.length<1)
    {
      print("无新闻数据获取，请检查网络情况！");
      return ;
    }
    for(int i=0;i<newsDatas.length-1;i++)
    {
      newsData data =newsData();
      data.description=newsDatas[i].description;
      data.url=newsDatas[i].url;
      data.picUrl=newsDatas[i].url;
      data.title=newsDatas[i].title;
      data.msg=newsDatas[i].msg;
      data.ctime=newsDatas[i].ctime;
      newsData td = await testProvider.insert(data);
      print('inserted:${td.toMap()}');
    }
    testProvider.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('综合新闻'),
      ),
      body:
      RefreshIndicator(
        onRefresh: _pullrefresh,
        child:Container(
          child: ListView.builder(
            itemCount: newsDatas.length,
            itemBuilder: (BuildContext context,int index){
              return Card(
                color:Colors.grey[250],
                elevation: 5.0,
                child: Builder(
                  builder: (context)=>InkWell(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(newsDatas[index].picUrl as String,fit:BoxFit.fitWidth),
                        Padding(padding: const EdgeInsets.all(10.0),
                          child: Text(
                            newsDatas[index].title.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                          child: Text('时间:${newsDatas[index].ctime}',
                            style: TextStyle(fontSize: 12.0),),

                        ),
                      ],
                    ),
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetail(url: newsDatas[index].url.toString(), title: newsDatas[index].title.toString()))),
                  ),
                ),
              );
            },
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _newsDataStore();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("已执行存储函数！"),)
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.description),

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}













