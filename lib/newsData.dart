import 'package:flutterappex4/database.dart';
import 'package:sqflite/sqflite.dart';
final String tableName = 'table_test';
final String columnId = '_id';
final String    columncode ='code';
final String columnmsg = 'msg';
final String columnctime = 'ctime';
final String columntitle = 'title';
final String columndescription = 'description';
final String columnpicUrl = 'picUrl';
final String columnurl = 'url';
class newsData{
  int code;
  String msg;
  String ctime;
  String title;
  String description;
  String picUrl;
  String url;
  Map<String , dynamic> toMap(){
    var map = <String, dynamic>{
      columnctime:ctime,
      columntitle: title,
      columndescription: description,
      columnpicUrl:picUrl,
      columnurl:url
    };
    if(code !=null)
    {
      map[columncode]=code;
    }
    return map;
  }
  newsData();
  newsData.fromMap(Map<String, dynamic>map)
  {
    code = map[columncode];
    title = map[columntitle];
    description =map[columndescription];
    picUrl=map[columnpicUrl];
    url=map[columnurl];
    ctime=map[columnctime];
  }
}
class TablenewsDataProvider{
  Database db;

  Future open(String path)async{

    db = await openDatabase(path,version: 1,
        onCreate: (Database db,int version)async{
          await db.execute('''
      create table $tableName(
      $columncode integer primary key ,
      $columnmsg text ,
      $columnctime text ,
      $columntitle text ,
      $columndescription text ,
      $columnpicUrl text ,
      $columnurl text )
      ''');
        });
  }
  Future<newsData> insert(newsData newsData)async{
    newsData.code = await db.insert(tableName, newsData.toMap());
    return newsData;
  }
  Future<newsData> getTodo(int nums)async{
    List<Map<String,dynamic>> maps = await db.query(tableName,
        columns: [columnctime,columncode,columntitle,columndescription,columnpicUrl,columnurl],
        where: "$columncode = ?",
        whereArgs: [nums]
    );
    if(maps.length>0)
    {
      return newsData.fromMap(maps.first);
    }
    return newsData();
  }
  Future<int> delete(int id)async{
    return await db.delete(tableName,where:'$columnId = ?',whereArgs: [id]);
  }
  Future<int> update(newsData newsData)async{
    return await db.update(tableName, newsData.toMap(),
        where: '$columnId = ?',whereArgs: [newsData.code]);
  }
  Future close() async => db.close();
}

























