import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../../../widget/description.dart';

// void main() => runApp(LogoApp2());
final description = """
通过AnimatedWidget来简化
1. 使用AnimatedWidget而不是通过addListener和setState来触发动画
2. AnimatedWidget列表
AnimatedBuilder, 
AnimatedModal­Barrier, 
DecoratedBox­Transition, 
FadeTransition, 
Positioned­Transition, 
Relative­Positioned­Transition, 
RotationTransition, 
ScaleTransition, 
SizeTransition, 
SlideTransition.
""";

// #docregion AnimatedLogo
class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Scaffold(
        appBar: AppBar(title: Text('测试AnimatedWidget')),
        body: Column(
          children: <Widget>[
            Description(
              desc: description,
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
// #enddocregion AnimatedLogo

class LogoApp2 extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp2>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
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
