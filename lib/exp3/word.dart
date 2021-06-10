class Word{
  int code;
  String msg;
  String hanzi;
  String py;
  String pyyb;
  String content;
  String bushou;
  String explain;
  Word({this.code,this.msg,this.hanzi,this.py,this.pyyb,this.content,this.bushou,this.explain});
  factory Word.fromJson(Map<String,dynamic>json)
  {
    return Word(
        code: json['code'],
        msg: json['msg'],
        hanzi: json['hanzi'],
        py: json['py'],
        pyyb: json['pyyb'],
        content: json['content'],
        bushou: json['bushou'],
        explain: json['explain']
        );

  }
}