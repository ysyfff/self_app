import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import '../../../../widget/description.dart';

// void main() => runApp(LogoApp2());
final description = """
监控动画过程
1. 使用addStatusListener来监控中间状态, starting, stopping, reversing
""";

// #docregion AnimatedLogo
class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Scaffold(
        appBar: AppBar(title: Text('测试addStatusListener')),
        body: Column(
          children: <Widget>[
            Description(desc: description,),
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
// #enddocregion AnimatedLogo

class LogoApp3 extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp3>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 10, end: 300).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedLogo(animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
