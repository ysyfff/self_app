/**
 * 报销业务
 */
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../widget/radioTile.dart';

enum SingingCharacter { lafayette, jefferson }

class WipeOut extends StatefulWidget {
  @override
  WipeOutState createState() => new WipeOutState();
}

class WipeOutState extends State<WipeOut> {
  String _radioValue = 'eat';
  Future<Post> post;

  var list = [];
  int _selectIndex = 1;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _dateController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));

  // SingingCharacter type = SingingCharacter.eat;

  @override
  Widget build(BuildContext context) {
    // 更新报销类型
    void updateType(a) {
      print(a);
      // setState(() {
      //   type = a;
      // });
    }

    void updateList() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        list = prefs.getStringList(_radioValue);
      });
    }

    void _onItemTapped(int index) {
      setState(() {
        _selectIndex = index;
      });
    }

    Future.delayed(Duration(microseconds: 1000), () {
      updateList();
    });

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('报销'),
      ),
      body: Column(
        children: <Widget>[_buildEnterForm()],
      ),
    );
  }

  @override
  initState(){
    super.initState();
    post = fetchPost();
    print(post.toString());
  }

  // 创建表单
  Widget _buildEnterForm() {
    var textShown = list == null ? '' : list.join('\n');
    void _handleTypeChange(type) {
      print(_radioValue);
      setState(() {
        _radioValue = type;
      });
    }

    ;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Row(
            children: <Widget>[
              RadioTile(
                value: 'eat',
                groupValue: _radioValue,
                label: '餐补',
                onChanged: _handleTypeChange,
              ),
              RadioTile(
                value: 'car',
                groupValue: _radioValue,
                label: '打车',
                onChanged: _handleTypeChange,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
          child: Column(
            children: <Widget>[
              TextField(
                // enabled: false,
                enableInteractiveSelection: false,
                focusNode: FocusNode(),
                controller: _dateController,
                onTap: () async {
                  // FocusScope.of(context).requestFocus(new FocusNode());
                  print('tap');
                  final DateTime picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2019),
                      lastDate: DateTime.now(),
                      builder: (BuildContext context, Widget child) {
                        return Theme(child: child, data: ThemeData.dark());
                      });

                  // DateTime dateTime = DateTime.now();
                  setState(() {
                    if (picked != null) {
                      _dateController.text =
                          DateFormat('yyyy-MM-dd').format(picked);
                    }
                  });
                },
                decoration: InputDecoration(hintText: '请选择时间', labelText: '时间'),
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: '请输入金额', labelText: '金额'),
              ),
            ],
          ),
        ),
        RaisedButton(
          child: Text('提交'),
          onPressed: () async {
            FocusScope.of(context).requestFocus(FocusNode()); //取消
            SharedPreferences prefs = await SharedPreferences.getInstance();
            final date = _dateController.text;
            final money = _controller.text;
            setState(() {
              _controller.text = '';
            });
            var newStringItem = '${date},${money}';

            var stringList = prefs.getStringList(_radioValue);
            if (stringList == null) {
              stringList = [];
            }
            stringList.add(newStringItem);
            await prefs.setStringList(_radioValue, stringList);
            setState(() {
              list = stringList;
            });
            // updateList();
          },
        ),
        Text(textShown)
      ],
    );
  }

  //请求数据

}

class Post {
  final dynamic money;
  final String type;
  final String date;

  Post({this.type, this.date, this.money});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      type: json['type'],
      date: json['date'],
      money: json['money'],
    );
  }
}

Future<Post> fetchPost() async{
  final response = await http.get('http://47.91.155.221:8081/api/wipeout/update');
  if(response.statusCode == 200){
    final result = json.decode(response.body);
    print('请求的数据: $result');
    return Post.fromJson(result);
  }
}
