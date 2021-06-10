import 'package:sqflite/sqflite.dart';

final String tableName = 'table_test';
final String columnId = '_id';
final String columnuserInfo = 'userInfo';
final String columnuserPsw = 'userPsw';

class acct{
  int id;
  String userInfo;
  String userPsw;
  bool done;
  Map<String , dynamic> toMap(){
    var map = <String, dynamic>{
      columnuserInfo: userInfo,
      columnuserPsw: userPsw
    };
    if(id !=null)
      {
        map[columnId]=id;
    }
    return map;
  }
  acct();
  acct.fromMap(Map<String, dynamic>map)
  {
    id = map[columnId];
    userInfo = map[columnuserInfo];
    userPsw =map[columnuserPsw];
  }
}
class TableacctProvider{
  Database db;
  Future open(String path)async{
    db = await openDatabase(path,version: 1,
    onCreate: (Database db,int version)async{
      await db.execute('''
      create table $tableName(
      $columnId integer primary key autoincrement,
      $columnuserInfo text not null,
      $columnuserPsw text not null)
      ''');
    });
  }
  Future<acct> insert(acct acct)async{
    acct.id = await db.insert(tableName, acct.toMap());
    return acct;
  }
  Future<acct> getTodo(acct acctIn)async{
    List<Map<String, dynamic>> maps =await db.rawQuery(
    "Select * from ${tableName} where ${columnuserInfo} = ${acctIn.userInfo}"
    );
    if(maps.length>0)
      {
        return acct.fromMap(maps.first);
      }
    return acct();
  }
  Future<int> delete(int id)async{
    return await db.delete(tableName,where:'$columnId = ?',whereArgs: [id]);
  }
  Future<int> update(acct acct)async{
    return await db.update(tableName, acct.toMap(),
    where: '$columnId = ?',whereArgs: [acct.id]);
  }
  Future close() async => db.close();
}

























