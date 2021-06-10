import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'word.dart';
import 'dictQuery.dart' as dict;
Future<List<Word>>getWordDatas()async{
  final response=await http.get(Uri.parse(
      "http://api.tianapi.com/txapi/xhzd/index?key=2d356e7ab83513e2f8654cc8dcc60b79&word=${dict.keyWord}"));
  Utf8Decoder decode=new Utf8Decoder();
  Map<String, dynamic> result=jsonDecode(decode.convert(response.bodyBytes));
  print(result);
  List<Word> datas;
  datas= result['newslist'].map<Word>((item)=> Word.fromJson(item)).toList();
  return datas;
}