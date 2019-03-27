/**
 * RadioListTile只能用在Column中，不能用在Row中
 */
import 'package:flutter/material.dart';

class TestRadioListTile extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TestRadioListTile> {
  var _character = 'car';

  void _handleRadio(String char) {
    setState(() {
      _character = char;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('测试RadioListTile'),
        ),
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
}
