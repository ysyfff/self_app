import 'package:flutter/material.dart';

class Notebook extends StatefulWidget {
  @override
  NotebookState createState() => new NotebookState();
}

class NotebookState extends State<Notebook> {
  @override
  build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('记事本')), body: _buildBody());
  }

  _buildBody() {
    return Container(child: Text('呵呵'));
  }
}
