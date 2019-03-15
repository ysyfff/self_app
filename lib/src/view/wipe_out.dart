/**
 * 报销业务
 */
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../../widget/RadioTile.dart';

enum SingingCharacter { lafayette, jefferson }

class WipeOut extends StatefulWidget {
  @override
  WipeOutState createState() => new WipeOutState();
}

class WipeOutState extends State<WipeOut> {
  String _radioValue = 'eat';
  var list = [];
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

    Future.delayed(Duration(microseconds: 1000), () {
      updateList();
    });

    return new Scaffold(
        appBar: new AppBar(
          title: const Text('报销'),
        ),
        body: Column(
          children: <Widget>[_buildEnterForm()],
        ));
  }

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
        Text(_radioValue),
        Row(
          children: <Widget>[
            // Radio(
            //   // title: Text('餐饮'),
            //   value: 'eat',
            //   groupValue: _radioValue,
            //   onChanged: _handleTypeChange,
            // ),
            // Text('餐饮'),
            // Radio(
            //   // title: Text('打车'),
            //   value: 'car',
            //   groupValue: _radioValue,
            //   onChanged: _handleTypeChange,
            // ),
            // Text('打车'),
            // RadioListTile<String>(
            //   title: const Text('eat'),
            //   value: 'eat',
            //   groupValue: _radioValue,
            //   onChanged: _handleTypeChange,
            // ),
            // RadioListTile<String>(
            //   title: const Text('car'),
            //   value: 'car',
            //   groupValue: _radioValue,
            //   onChanged: _handleTypeChange,
            // ),
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
        TextField(
          controller: _controller,
          decoration: InputDecoration(hintText: '请输入金额', labelText: '金额'),
        ),
        TextField(
          controller: _dateController,
          onTap: () async {
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
                _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
              }
            });
          },
          decoration: InputDecoration(hintText: '请选择时间', labelText: '时间'),
        ),
        RaisedButton(
          child: Text('提交'),
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            final date = _dateController.text;
            final money = _controller.text;
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
}
