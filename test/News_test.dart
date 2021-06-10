import 'package:flutter_test/flutter_test.dart';
import 'package:flutterappex4/newsData.dart';
import '../lib/exp3/News.dart';

void main() {
  // 单一的测试
  test ("测试新闻类", () async{
    TablenewsDataProvider tmpdb =TablenewsDataProvider();
    News tmpNews = News();
    expect(tmpNews.toString(),'Instance of \'News\'');
    expect(tmpNews.text,'success' );
    expect(tmpdb.toString(),'Instance of \'TablenewsDataProvider\'' );
   // expect(tmpdb.getTodo(0),tmpNews);
  });
}