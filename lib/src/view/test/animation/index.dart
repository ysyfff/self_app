/**
 * 汇集动画模块
 */

import 'package:flutter/material.dart';
import 'animation.dart';
import 'animatedLogo.dart';
import 'animationBreathing.dart';
import 'animationBuilder.dart';

class AnimationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title:Text('4种动画方式')),
    body:Column(
      children: <Widget>[
        FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext _) => LogoApp()));
                },
                child: Container(
                  padding: EdgeInsets.all(11),
                  // margin: EdgeInsets.all(0),
                  color: Colors.pink,
                  child: Row(children: <Widget>[
                    Text('Animation'),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ]),
                )),
        FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext _) => LogoApp2()));
                },
                child: Container(
                  padding: EdgeInsets.all(11),
                  // margin: EdgeInsets.all(0),
                  color: Colors.pink,
                  child: Row(children: <Widget>[
                    Text('AnimatedLogo'),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ]),
                )),
            FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext _) => LogoApp3()));
                },
                child: Container(
                  padding: EdgeInsets.all(11),
                  // margin: EdgeInsets.all(0),
                  color: Colors.pink,
                  child: Row(children: <Widget>[
                    Text('AnimatedBreathing'),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ]),
                )),
            FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext _) => LogoApp6()));
                },
                child: Container(
                  padding: EdgeInsets.all(11),
                  // margin: EdgeInsets.all(0),
                  color: Colors.pink,
                  child: Row(children: <Widget>[
                    Text('AnimatedBuilder'),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ]),
                )),
      ],
    ));
  }
}