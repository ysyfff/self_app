
import 'package:flutter/material.dart';

// enum SingingCharacter { lafayette, jefferson }

class Test extends StatefulWidget {
  @override
  TestState createState() => new TestState();
}

class TestState extends State<Test> {
  // SingingCharacter _character = SingingCharacter.lafayette;
  var _character = 'car';

  void _handleRadio(String char) {
    setState((){
      _character = char;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('测试')),
        body: Column(
          children: <Widget>[
            RadioListTile<String>(
              title: const Text('eat'),
              value: 'eat',
              groupValue: _character,
              onChanged: _handleRadio,
            ),
            RadioListTile<String>(
              title: const Text('car'),
              value: 'car',
              groupValue: _character,
              onChanged: _handleRadio,
            ),
          ],
        ));
  }

  Widget _buildTest() {}
}