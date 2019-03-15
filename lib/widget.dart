import 'package:flutter/material.dart';

class RadioTile extends StatefulWidget {
  // 接收传入的变量
  RadioTile(
      {@required this.value,
      @required this.onChanged,
      @required this.groupValue,
      @required this.label});

  final value, groupValue;
  final label;
  final Function onChanged;

  @override
  RadioTileState createState() => new RadioTileState();
}

class RadioTileState extends State<RadioTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(widget.value);
      },
      child: Row(
        children: <Widget>[
          Radio(
            activeColor: Colors.green,
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChanged,
          ),
          Text(widget.label)
        ],
      ),
    );
  }
}
