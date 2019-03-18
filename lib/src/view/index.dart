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
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectIndex == 1 ? WipeOut() : Test(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.money_off), title: Text('1')),
          BottomNavigationBarItem(
              icon: Icon(Icons.bug_report), title: Text('2')),
        ],
        currentIndex: _selectIndex,
        fixedColor: Colors.greenAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
