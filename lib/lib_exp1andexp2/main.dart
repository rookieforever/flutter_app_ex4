import 'package:flutter/material.dart';
import 'tabBar.dart';
import 'exp1/lib/signUpPage.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: '实验四',
      home:Scaffold(
        appBar: AppBar(
          title: Text('第23小组实验四'),
        ),
        body: MyWidget(),
      )
    );
  }
}
class MyWidget extends StatelessWidget{
    Widget build(BuildContext context)
    {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                child: Text('5120182551胡载宜'),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
             },
        ),
            ElevatedButton(
                child: Text('5120183598兰望'),
        ),
            ElevatedButton(
              child: Text('5120182226李晗斌'),
            ),
      ],
      ));
}}