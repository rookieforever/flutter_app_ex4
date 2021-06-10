import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'wordByApi.dart';
import 'word.dart';
TextEditingController keywordController = TextEditingController();
String keyWord=keywordController.text;
class querPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => querPageState();
}
class querPageState extends State<querPage> {
  //手机号的控制器
  List<Word> _datas = [];
  bool _cancelConnect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录信息'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          TextField(
            controller: keywordController,
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.youtube_searched_for),
              labelText: '请输入你要查询的字...',
            ),
            autofocus: false,
          ),
          SizedBox(height:20),
          Container(
              width:double.maxFinite-50,
              child:ElevatedButton(

                onPressed: _query,
                style: ButtonStyle(),
                child: Text('查询'),
              )
          ),

          Flexible(
            child:ListView.builder(
              shrinkWrap:true,
              itemCount: _datas.length,
              itemBuilder: (BuildContext context,int index){
                return Card(
                  color:Colors.grey[250],
                  elevation: 5.0,
                  child: Builder(
                    builder: (context)=>InkWell(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: const EdgeInsets.all(10.0),
                            child: Text(
                              _datas[index].hanzi.toString(),
                              style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                            child: Text('拼音:${_datas[index].pyyb.toString()}',
                              style: TextStyle(fontSize: 12.0),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                            child: Text('部首:${_datas[index].bushou.toString()}',
                              style: TextStyle(fontSize: 12.0),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                            child: Text('解释:${_datas[index].content.toString()}',
                              style: TextStyle(fontSize: 12.0),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                            child: Text('延伸:${_datas[index].explain.toString()}',
                              style: TextStyle(fontSize: 12.0),),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )

        ],
      ),
    );
  }

  void _query() {
    keyWord=keywordController.text;
    _datas=null;
    getWordDatas().then((List<Word> datas) {
      if (!_cancelConnect) {
        setState(() {
          _datas = datas;
        });
      }
    }).catchError((e) {
      print('获取数据出错！${e}');
    }).whenComplete(() {
      print('字典数据获取完毕');
    }).timeout(Duration(seconds: 5)).catchError((timeOut) {
      print('超时:${timeOut}');
      _cancelConnect = true;
    });
  }
}