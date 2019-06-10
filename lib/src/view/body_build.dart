import 'package:flutter/material.dart';

class BodyBuild extends StatefulWidget {
  @override
  BodyBuildState createState() => new BodyBuildState();
}

class BodyBuildState extends State<BodyBuild>{
  @override 
  build(BuildContext c){
    return Scaffold(appBar: AppBar(title: Text('健身')), body: _buildBody());
  }

  _buildBody(){
    return Container(child: Text('健身走起'));
  }
}
