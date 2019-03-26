import 'package:flutter/material.dart';
import 'wipe_out.dart';
import 'test.dart';

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
  int _selectIndex = 1;
  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // 点击空白区域，隐藏键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: _selectIndex == 0 ? WipeOut() : Test(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.money_off), title: Text('报销')),
          BottomNavigationBarItem(
              icon: Icon(Icons.bug_report), title: Text('测试')),
        ],
        currentIndex: _selectIndex,
        // fixedColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
