import 'package:flutter/material.dart';
import 'wipe_out.dart';
import 'test/test.dart';
import 'notebook.dart';
import 'body_build/body_build.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigator();
  }
}

class BottomNavigator extends StatefulWidget {
  @override
  BottomNavigatorState createState() => BottomNavigatorState();
}

class BottomNavigatorState extends State<BottomNavigator> {
  int _selectIndex = 0;
  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectIndex = index;
    });
  }

  getContent(index) {
    var content;
    if (index == 0) {
      content = WipeOut();
    } else if (index == 1) {
      content = Notebook();
    } else if (index == 2) {
      content = Test();
    } else if (index == 3) {
      content = BodyBuild();
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // 点击空白区域，隐藏键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: this.getContent(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.money_off), title: Text('报销')),
          BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('记事本')),
          BottomNavigationBarItem(
              icon: Icon(Icons.bug_report), title: Text('测试')),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_run), title: Text('健身')),
        ],
        currentIndex: _selectIndex,
        // fixedColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
