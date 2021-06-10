import 'package:flutter/material.dart';
import 'pageDetail.dart';
import 'exp1/lib/signUpPage.dart' as User;
class showUserInfo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
          children: <Widget>[
          getListViewOne(),getUserGrid()
          ]
      )

    );

  }
}
ListView  getListViewOne(){
  return ListView(
    shrinkWrap:true,
    children: [
      ListTile(
        leading: CircleAvatar(
          child: Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.jshddq.net%2FUploadFiles%2Fimg_1_3240370303_1810028540_26.jpg&refer=http%3A%2F%2Fwww.jshddq.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1623223754&t=9081cbbfa37f7891a78ad8cba793b621"),
          radius: 40,
        ),
        title: Text('用户名：${User.newUser.userName}'),
        subtitle: Text('用户信息'),

        trailing: Icon(Icons.keyboard_arrow_right),
        isThreeLine: false,
        dense: false,
        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 12),
        enabled: true,
      ),
    ],
  );

}
GridView getUserGrid()
{
  return GridView(
      shrinkWrap:true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //横轴三个子widget
          childAspectRatio: 1.0 //宽高比为1时，子widget
      ),
      children:<Widget>[//图表堆叠，暂未写功能
        Icon(Icons.add),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast)
      ]
  );
}