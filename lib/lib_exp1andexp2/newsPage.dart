import 'package:flutter/material.dart';
import 'pageDetail.dart';
class showNews extends StatefulWidget {
  @override
  _showNewsState createState() => _showNewsState();
}
class _showNewsState extends State<showNews> {
List<String> picUrl=["https://pics5.baidu.com/feed/6159252dd42a2834fa78ccb96664b0e217cebf84.jpeg?token=29df408c914ee7a0d77ccf9c4ea05348","https://pics3.baidu.com/feed/a2cc7cd98d1001e9c0fab1cec13902e456e797e9.jpeg?token=9cdb25bdf5379586139bafcdd5a29f0b","https://dss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1306671236,2554128638&fm=55&app=54&f=JPEG?w=1140&h=640","https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0510%2F3d33e1ecp00qsvlfm00coc000hs00a8m.png&thumbnail=650x2147483647&quality=80&type=jpg","https://pics7.baidu.com/feed/6d81800a19d8bc3ec067bfccb49bdc16a8d34565.jpeg?token=e3057ba6cf9ac92cbc596dff497c9f7f","https://pics2.baidu.com/feed/359b033b5bb5c9ead95a85ec8ad5cf083bf3b30d.jpeg?token=dbd8dafac314b9939b8cd8811c27a81a","https://pics4.baidu.com/feed/960a304e251f95cadee5a94fe8120536660952c7.jpeg?token=23717eff16ca416cf3cd450e40414ee2","https://pics2.baidu.com/feed/0df431adcbef7609b23bcbe6b511dac47dd99ee8.jpeg?token=baa33eb02118638c57393cef27562759","https://pics3.baidu.com/feed/a8ec8a13632762d0bfee8c53ee2471f2533dc65e.png?token=ce3ba5a8653d18d948b2e12ded94e3d1","https://pics3.baidu.com/feed/a8ec8a13632762d0bfee8c53ee2471f2533dc65e.png?token=ce3ba5a8653d18d948b2e12ded94e3d1","https://dss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=785301990,4056827664&fm=55&app=54&f=JPEG?w=1140&h=640"];
List<String> title=["国家卫健委：5月9日新增确诊病例11例，均为境外输入病例","中国红十字会向印提供100万美元援助","是否有中国公民在阿富汗连环袭击中伤亡？外交部回应","停车2小时被共享电动车层层包围，当事人：又尴尬又崩溃","三亚跳舞坠亡红衣女子今日已火化，“遗书”曝光？","美国宣布进入国家紧急状态","云南大理一架森林灭火直升机上午在洱海取水时失事，坠入洱海！","今年红场大阅兵，普京撂下一句狠话！","第三只金钱豹仍未寻获，杭州市委书记赴现场督察指导","员工一年内告9家用人单位被认定碰瓷 罚款5万元"];
List<String> description=["5月9日0—24时，31个省（自治区、直辖市）和新疆生产建设兵团报告新增确诊病例11例，均为境外输入病例（上海4例，广东2例，陕西2例，浙江1例，四川1例，云南1例）；无新增死亡病例；无新增疑似病例。","中国驻印度大使孙卫东刚刚发推称，中国红十字会捐赠的首批100台制氧机、40台呼吸机以及其他防疫物资，今天已由中国货机从成都运抵印度。孙卫东的这条推文还配上了相关图片。图片显示，装物资的箱子外面写有“命运与共，战胜疫情”的字样。","外交部网站5月9日消息，外交部发言人华春莹就阿富汗发生连环袭击造成重大人员伤亡答记者问。问：阿富汗内政部宣布，当地时间5月8日下午，首都喀布尔一女子中学附近发生连环袭击，造成至少50人死亡、100人受伤，其中大部分是女学生。截至目前，尚无组织宣称负责。中方对此有何评论？是否有中国公民在袭击中伤亡？答：我们对有关袭击感到震惊，强烈谴责这一暴力行径。中方向遇难者表示沉痛哀悼，向遇难者家属和伤者表示诚挚慰问。经核实，没有中国公民在此次袭击事件中伤亡。","5日周口，一女生的私人电动车被共享电瓶车包围。当事人邝同学表示，本想着一会就出来，就把电动车停在了共享单车区域内。当时周围没车，结果2小时后，车子已被层层包围。在朋友帮助下，搬了20多分钟才挪出来。","5月9日上午9点，三亚跳舞坠亡红衣女子史某某遗体在三亚仙逸园殡仪馆火化，其父母领取骨灰后离开。史某某遗体的火化是否代表案件已排除他杀确认自杀？对此三亚市公安局接受记者采访时表示，史某某火化并不代表案件有了新进展，“火化与死者身后事的处理，不代表案件有了最新进展，因为她后事由家属掌握。”","当地时间5月9日，美国宣布进入国家紧急状态，原因是当地最大燃油管道运营商遭网络攻击下线。美国最大的成品油管道运营商Colonial Pipeline在当地时间周五(5月7日)因受到勒索软件攻击，被迫关闭其美国东部沿海各州供油的关键燃油网络。","5月10日，上游新闻记者从权威渠道获悉，一架用于云南大理山火扑救的直升机于当天上午在洱海取水时不幸失事，坠入洱海中。目前，具体伤亡情况不详。","非常时期，俄罗斯又阅兵了。1.2万受阅士兵，坦克、飞机、洲际导弹，各种高精尖武器，亮相莫斯科红场。印度仍是人间炼狱，俄罗斯却在大阅兵，当然，中国人更是乐享春天。同样的危机，因为决策有异，情况完全不同。", "据杭州发布微信公众号消息，5月9日下午和晚上，省委常委、市委书记周江勇赴富阳区杭州野生动物世界、西湖区转塘街道何家村，就金钱豹外逃处置工作进行督察指导，现场听取工作汇报，查看杭州野生动物世界整改情况。他强调，要认真贯彻落实省委书记袁家军、省长郑栅洁重要批示精神，继续全力搜寻抓捕逃逸金钱豹，做好相关安全防范工作，确保人民生命安全。戚哮虎、金志、朱建明、王宏参加。","【员工一年内告9家用人单位被认定碰瓷 罚款5万元】广东省高级人民法院日前发布劳动争议十大典型案例，其中，康某“职业碰瓷”诉某家具厂劳动争议案入选。2018年9月，康某入职某家具厂，2018年12月，康某以被违法解除劳动关系为由，请求家具厂支付赔偿金等近14万元，但家具厂主张，康某入职该工厂只有3天时间，实为“职业碰瓷”。经鉴定，自2013年以来，康某在江西赣州、福建莆田等多地参与近30件案件的诉讼，仅2018年，康某在中山地区劳动仲裁机构以及法院提起的诉讼达10件，涉及9个用人单位。法院认为，康某确实存在频繁、短暂地与不同用人单位建立劳动关系，再以各种其他理由解除劳动关系后通过诉讼谋取利益的情形，以妨碍民事诉讼为由，决定对康某进行罚款5万元。（工人日报）"];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5月10日十大新闻'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Image.network(
                picUrl[0],width: 75,
                height: 200),//设置图片的显示大小
            title: Text(title[0],
              overflow: TextOverflow.ellipsis,),//文本过多时隐藏
            subtitle: Text(description[0], maxLines: 4,overflow: TextOverflow.ellipsis),//最大行数为4
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>new detailPageState (news:new News(title[0],description[0],picUrl[0]))));//传参，跳转到该页面
            },
          ),
          ListTile(
            leading: Image.network(
                "https://pics3.baidu.com/feed/a2cc7cd98d1001e9c0fab1cec13902e456e797e9.jpeg?token=9cdb25bdf5379586139bafcdd5a29f0b"
                ,width: 75,
                height: 200),
            title: Text("中国红十字会向印提供100万美元援助",
              overflow: TextOverflow.ellipsis,),
            subtitle: Text("中国驻印度大使孙卫东刚刚发推称，中国红十字会捐赠的首批100台制氧机、40台呼吸机以及其他防疫物资，今天已由中国货机从成都运抵印度。孙卫东的这条推文还配上了相关图片。图片显示，装物资的箱子外面写有“命运与共，战胜疫情”的字样。", maxLines: 4,overflow: TextOverflow.ellipsis),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 30),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>new detailPageState (news:new News(title[1],description[1],picUrl[1]))));
            },
          ),
          ListTile(
            leading: Image.network(
                "https://dss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1306671236,2554128638&fm=55&app=54&f=JPEG?w=1140&h=640",width: 75,
                height: 200),
            title: Text("是否有中国公民在阿富汗连环袭击中伤亡？外交部回应",
              overflow: TextOverflow.ellipsis,),
            subtitle: Text("外交部网站5月9日消息，外交部发言人华春莹就阿富汗发生连环袭击造成重大人员伤亡答记者问。问：阿富汗内政部宣布，当地时间5月8日下午，首都喀布尔一女子中学附近发生连环袭击，造成至少50人死亡、100人受伤，其中大部分是女学生。截至目前，尚无组织宣称负责。中方对此有何评论？是否有中国公民在袭击中伤亡？答：我们对有关袭击感到震惊，强烈谴责这一暴力行径。中方向遇难者表示沉痛哀悼，向遇难者家属和伤者表示诚挚慰问。经核实，没有中国公民在此次袭击事件中伤亡。", maxLines: 4,overflow: TextOverflow.ellipsis),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>new detailPageState (news:new News(title[2],description[2],picUrl[2]))));
              },
          ),
          ListTile(
            leading: Image.network(
                "https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0510%2F3d33e1ecp00qsvlfm00coc000hs00a8m.png&thumbnail=650x2147483647&quality=80&type=jpg",width: 75,
                height: 200),
            title: Text("停车2小时被共享电动车层层包围，当事人：又尴尬又崩溃", maxLines: 1,
              overflow: TextOverflow.ellipsis,),
            subtitle: Text("5日周口，一女生的私人电动车被共享电瓶车包围。当事人邝同学表示，本想着一会就出来，就把电动车停在了共享单车区域内。当时周围没车，结果2小时后，车子已被层层包围。在朋友帮助下，搬了20多分钟才挪出来。", maxLines: 4,overflow: TextOverflow.ellipsis),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>new detailPageState (news:new News(title[3],description[3],picUrl[3]))));
              },
          ),
          ListTile(
            leading: Image.network("https://pics7.baidu.com/feed/6d81800a19d8bc3ec067bfccb49bdc16a8d34565.jpeg?token=e3057ba6cf9ac92cbc596dff497c9f7f",width: 75,
                height: 200),
            title: Text("三亚跳舞坠亡红衣女子今日已火化，“遗书”曝光？", maxLines: 1,overflow: TextOverflow.ellipsis,),
            subtitle: Text("5月9日上午9点，三亚跳舞坠亡红衣女子史某某遗体在三亚仙逸园殡仪馆火化，其父母领取骨灰后离开。史某某遗体的火化是否代表案件已排除他杀确认自杀？对此三亚市公安局接受记者采访时表示，史某某火化并不代表案件有了新进展，“火化与死者身后事的处理，不代表案件有了最新进展，因为她后事由家属掌握。”", maxLines: 4,overflow: TextOverflow.ellipsis),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>new detailPageState (news:new News(title[4],description[4],picUrl[4]))));
              },
          ),
          ListTile(
            leading: Image.network(
                "https://pics2.baidu.com/feed/359b033b5bb5c9ead95a85ec8ad5cf083bf3b30d.jpeg?token=dbd8dafac314b9939b8cd8811c27a81a",width: 75,
                height: 200),
            title: Text("美国宣布进入国家紧急状态！",
              overflow: TextOverflow.ellipsis,),
            subtitle: Text("当地时间5月9日，美国宣布进入国家紧急状态，原因是当地最大燃油管道运营商遭网络攻击下线。美国最大的成品油管道运营商Colonial Pipeline在当地时间周五(5月7日)因受到勒索软件攻击，被迫关闭其美国东部沿海各州供油的关键燃油网络。", maxLines: 4,overflow: TextOverflow.ellipsis),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>new detailPageState (news:new News(title[5],description[5],picUrl[5]))));
              },
          ),
          ListTile(
            leading: Image.network(
                "https://pics4.baidu.com/feed/960a304e251f95cadee5a94fe8120536660952c7.jpeg?token=23717eff16ca416cf3cd450e40414ee2",width: 75,
                height: 200),
            title: Text("云南大理一架森林灭火直升机上午在洱海取水时失事，坠入洱海",
              overflow: TextOverflow.ellipsis,),
            subtitle: Text("5月10日，上游新闻记者从权威渠道获悉，一架用于云南大理山火扑救的直升机于当天上午在洱海取水时不幸失事，坠入洱海中。目前，具体伤亡情况不详。", maxLines: 4,overflow: TextOverflow.ellipsis),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>new detailPageState (news:new News(title[6],description[6],picUrl[6]))));
              },
          ),
          ListTile(
            leading: Image.network(
                "https://pics2.baidu.com/feed/0df431adcbef7609b23bcbe6b511dac47dd99ee8.jpeg?token=baa33eb02118638c57393cef27562759",width: 75,
                height: 200),
            title: Text("今年红场大阅兵，普京撂下一句狠话！",
              overflow: TextOverflow.ellipsis,),
            subtitle: Text("非常时期，俄罗斯又阅兵了。1.2万受阅士兵，坦克、飞机、洲际导弹，各种高精尖武器，亮相莫斯科红场。印度仍是人间炼狱，俄罗斯却在大阅兵，当然，中国人更是乐享春天。同样的危机，因为决策有异，情况完全不同。", maxLines: 4,overflow: TextOverflow.ellipsis),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>new detailPageState (news:new News(title[7],description[7],picUrl[7]))));
              },
          ),
          ListTile(
            leading: Image.network(
                "https://pics3.baidu.com/feed/a8ec8a13632762d0bfee8c53ee2471f2533dc65e.png?token=ce3ba5a8653d18d948b2e12ded94e3d1",width: 75,
                height: 200),
            title: Text("第三只金钱豹仍未寻获，杭州市委书记赴现场督察指导",
              overflow: TextOverflow.ellipsis,),
            subtitle: Text("据杭州发布微信公众号消息，5月9日下午和晚上，省委常委、市委书记周江勇赴富阳区杭州野生动物世界、西湖区转塘街道何家村，就金钱豹外逃处置工作进行督察指导，现场听取工作汇报，查看杭州野生动物世界整改情况。他强调，要认真贯彻落实省委书记袁家军、省长郑栅洁重要批示精神，继续全力搜寻抓捕逃逸金钱豹，做好相关安全防范工作，确保人民生命安全。戚哮虎、金志、朱建明、王宏参加。", maxLines: 4,overflow: TextOverflow.ellipsis),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>new detailPageState (news:new News(title[8],description[8],picUrl[8]))));
              },
          ),
          ListTile(
            leading: Image.network(
                picUrl[9],width: 75,
                height: 200),//设置图片的显示大小
            title: Text(title[9],
              overflow: TextOverflow.ellipsis,),//文本过多时隐藏
            subtitle: Text(description[9], maxLines: 4,overflow: TextOverflow.ellipsis),//最大行数为4
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>new detailPageState (news:new News(title[9],description[9],picUrl[9]))));//传参，跳转到该页面
            },
          ),
        ],
      ),
    );
  }
}





