import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import '../../../../widget/description.dart';
// #docregion LogoWidget

final description = '''
使用AnimatedBuilder重构
1. AnimatedBuilder知道如何渲染transition
2. AnimatedBuilder不知道如何渲染widget也不知道如何管理animation
3. AnimatedBuilder列表
BottomSheet
ExpansionTile, 
PopupMenu, 
ProgressIndicator,
RefreshIndicator,
Scaffold, SnackBar, 
TabBar, 
TextField.
''';

class LogoWidget extends StatelessWidget {
  // Leave out the height and width so it fills the animating parent
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: FlutterLogo(),
      );
}
// #enddocregion LogoWidget

// #docregion GrowTransition
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('使用AnimatedBuilder')),
      body: Column(
        children: <Widget>[
          Description(
            desc: description,
          ),
          Center(
            child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) => Container(
                      height: animation.value,
                      width: animation.value,
                      child: child,
                    ),
                child: child),
          ),
          
        ],
      ));
}
// #enddocregion GrowTransition

class LogoApp6 extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

// #docregion print-state
class _LogoAppState extends State<LogoApp6>
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
  // #enddocregion print-state

  @override
  Widget build(BuildContext context) => GrowTransition(
        child: LogoWidget(),
        animation: animation,
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  // #docregion print-state
}
