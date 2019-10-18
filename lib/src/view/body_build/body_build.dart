import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'play_video.dart';
import 'play_video_pure.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class BodyBuild extends StatefulWidget {
  @override
  BodyBuildState createState() => new BodyBuildState();
}

class BodyBuildState extends State<BodyBuild> {
  List<String> _paths = [];
  List<ChewieController> controllerList = [];
  bool showVideo = false;

  @override
  void initState() {
    super.initState();
    _getPaths();
  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      appBar: AppBar(
        title: Text('健身'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            tooltip: '添加视频',
            onPressed: () => _addVideo(c),
          )
        ],
      ),
      body: _buildBody(c),
    );
  }

  _buildBody(BuildContext appC) {
    final showPaths = _paths;
    return showPaths.length > 0
        ? ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: (showPaths.length / 2).ceil(),
            itemBuilder: (BuildContext c, int index) {
              return Row(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      color: Colors.blue,
                      height: 120,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                      width: 180,
                      child: new PlayVideoPure(
                        path: showPaths[2 * index],
                      ),
                      transform: Matrix4.rotationZ(0.01),
                    ),
                    onTap: () {
                      _palyVideo(appC, showPaths[2 * index]);
                    },
                  ),
                  GestureDetector(
                      child: 2 * index + 1 < showPaths.length
                          ? Container(
                              height: 120,
                              color: Colors.blue,
                              margin: EdgeInsets.only(top: 10, left: 10),
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 5),
                              width: 180,
                              transform: Matrix4.rotationZ(0.01),
                              child: new PlayVideoPure(
                                  path: 2 * index + 1 < showPaths.length
                                      ? showPaths[2 * index + 1]
                                      : ''))
                          : Text(''),
                      onTap: () {
                        _palyVideo(appC, showPaths[2 * index + 1]);
                      })
                ],
              );
            },
          )
        : Center(
            child: Text('空空如也'),
          );
  }

  // 获取本地缓存的paths
  _getPaths() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> paths = prefs.getStringList('paths');

    if (paths != null) {
      setState(() {
        _paths = paths;
      });
    }
  }


  _palyVideo(c, path) {
    Navigator.push(
        c,
        MaterialPageRoute(
            builder: (BuildContext _) => new PlayVideo(path: path)));
  }

  void _addVideo(c) async {
    String _path = '';
    try {
      _path = await FilePicker.getFilePath(type: FileType.VIDEO);

      if (_path != null) {
        final prefs = await SharedPreferences.getInstance();
        setState(() {
          _paths.add(_path);
          prefs.setStringList('paths', _paths);
        });
      }
    } on PlatformException catch (e) {
      print('Unsupported operation' + e.toString());
    }
  }
}
