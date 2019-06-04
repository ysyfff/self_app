import 'package:flutter/material.dart';
// import 'package:flutter/animation.dart';
import 'radio_list_tile.dart';
import 'animation/index.dart';
import 'dartlang/dartlang.dart';
import 'httpd.dart';
// enum SingingCharacter { lafayette, jefferson }

class Test extends StatefulWidget {
  @override
  TestState createState() => new TestState();
}

class TestState extends State<Test> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('测试')),
        body: Column(
          children: <Widget>[
            FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext _) => DartLang()));
                },
                child: Container(
                  padding: EdgeInsets.all(11),
                  // margin: EdgeInsets.all(0),
                  color: Colors.pink,
                  child: Row(children: <Widget>[
                    Text('Dart知识点'),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ]),
                )),
            RaisedButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext _) => TestRadioListTile()));
                },
                child: Container(
                  padding: EdgeInsets.all(11),
                  // margin: EdgeInsets.all(0),
                  color: Colors.pink,
                  child: Row(children: <Widget>[
                    Text('RadioListTile'),
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
                          builder: (BuildContext _) => AnimationWrapper()));
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
                          builder: (BuildContext _) => MyApp(post: fetchPost())));
                },
                child: Container(
                  padding: EdgeInsets.all(11),
                  // margin: EdgeInsets.all(0),
                  color: Colors.pink,
                  child: Row(children: <Widget>[
                    Text('Fetch data'),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ]),
                )),
          ],
        ));
  }
}

// LogoApp6
