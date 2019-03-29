/**
 * Animation animation 存储动态的值
 * AnimationController controller 动画类型(duration)
 */
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import '../../../../widget/description.dart';

// void main() => runApp(LogoApp());

final desctription = '''
知识点
1. animation的addListener配合setState来完成动画
2. 要想让一个类是私有的，以"_"开始命名
''';

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // #docregion addListener
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        // #enddocregion addListener
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
        // #docregion addListener
      });
    // #enddocregion addListener
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('测试动画'),
        ),
        body: Column(
          children: <Widget>[
            Description(
              desc: desctription,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: animation.value,
                width: animation.value,
                child: FlutterLogo(),
              ),
            ),
          ],
        ));
  }
}
