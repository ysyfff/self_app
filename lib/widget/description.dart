import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  Description({this.desc});

  final desc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              this.desc,
              style:
                  TextStyle(color: Theme.of(context).accentColor, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
