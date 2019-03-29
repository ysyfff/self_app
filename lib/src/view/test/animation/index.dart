/**
 * 汇集动画模块
 */

import 'package:flutter/material.dart';
import 'animation.dart';
import 'animatedLogo.dart';
import 'animationBreathing.dart';
import 'animationBuilder.dart';
import '../../../../widget/description.dart';

final description = '''
几个基本概念
1. Animation class，动画核心类
2. animation，通过Animation生成的对象，能够知道当前动画的状态
3. AnimationController管理Animation

动画过程
animatin在某个duration中不断的产生不同的值。值可能是linear, curve, a step function或者其他的你能设计出来的效果。根据animation怎么被控制，它可以run像reverse甚至在中间改变方向。

Animation类型
Animation<Double>
Animation<Color>
Animation<Size>
''';

class AnimationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('5种动画方式')),
        body: Column(
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
                    Text('AnimationSimultaneous'),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ]),
                )),
            Description(
              desc: description,
            ),
          ],
        ));
  }
}
