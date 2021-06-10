import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsDetail extends StatefulWidget {
  final String url;
  final String title;
  const NewsDetail({Key key, @required this.url,@required this.title}):super(key:key);
  @override
  NewsDetailState createState() => NewsDetailState();
}

class NewsDetailState extends State<NewsDetail> {
  bool loaded= false;
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  NewsDetailState({Key key});
  @override
  void initState()
  {
    super.initState();
    flutterWebViewPlugin.onStateChanged.listen((state) {
      print("state:${state.type}");
    });
    setState(() {
      loaded=true;
    });
  }
  Widget build(BuildContext context) {
    List<Widget>titleContent=[];
    titleContent.add(Text(widget.title,overflow: TextOverflow.ellipsis,
    style: TextStyle(fontSize: 13.0)),);
    if(!loaded)
      {
        titleContent.add(CupertinoActivityIndicator());
      }
    titleContent.add(Container(width: 50));
    return WebviewScaffold(
        url: widget.url,
    appBar: AppBar(
      title: Expanded(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
      ),
    ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}
