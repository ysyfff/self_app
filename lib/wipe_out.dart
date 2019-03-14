/**
 * 报销业务
 */
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

enum SingingCharacter { lafayette, jefferson }

class Test extends StatefulWidget {
  @override
  TestState createState() => new TestState();
}

class TestState extends State<Test> {
  SingingCharacter _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('测试')),
        body: Column(
          children: <Widget>[
            RadioListTile<SingingCharacter>(
              title: const Text('Lafayette'),
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Thomas Jefferson'),
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ],
        ));
  }

  Widget _buildTest() {}
}

class WipeOut extends StatefulWidget {
  @override
  WipeOutState createState() => new WipeOutState();
}

// class LifecycleWatcher extends StatefulWidget {
//   const LifecycleWatcher({ Key key }) : super(key: key);

//   @override
//   _LifecycleWatcherState createState() => _LifecycleWatcherState();
// }

// class _LifecycleWatcherState extends State<LifecycleWatcher> with WidgetsBindingObserver {
//     AppLifecycleState _lastLifecycleState;

//     @override
//     void initState(){
//       super.initState();
//       WidgetsBinding.instance.addObserver(this);
//     }

// }

class WipeOutState extends State<WipeOut> {
  var _radioValue = 'eat';
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
            Radio(
              // title: Text('餐饮'),
              value: 'eat',
              groupValue: _radioValue,
              onChanged: _handleTypeChange,
            ),
            Text('餐饮'),
            Radio(
              // title: Text('打车'),
              value: 'car',
              groupValue: _radioValue,
              onChanged: _handleTypeChange,
            ),
            Text('打车'),
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
