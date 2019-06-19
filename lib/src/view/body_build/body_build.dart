import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chewie/chewie.dart';
// import 'package:chewie/src/chewie_player.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'dart:math';
import 'play_video.dart';

class BodyBuild extends StatefulWidget {
  @override
  BodyBuildState createState() => new BodyBuildState();
}

class BodyBuildState extends State<BodyBuild> {
  List<String> _paths = [];
  bool showVideo = false;

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

  _buildBody(BuildContext app_c) {
    return _paths.length > 0
        ? ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: (_paths.length / 2).ceil(),
            itemBuilder: (BuildContext c, int index) {
              return Row(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      color: Colors.blue,
                      height: 80,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                      width: 180,
                      child: Text(
                        _paths[2 * index],
                      ),
                      transform: Matrix4.rotationZ(0.01),
                    ),
                    onTap: () {
                      _palyVideo(app_c, _paths[2 * index]);
                    },
                  ),
                  GestureDetector(
                      child: 2 * index + 1 < _paths.length
                          ? Container(
                              height: 80,
                              color: Colors.blue,
                              margin: EdgeInsets.only(top: 10, left: 10),
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 5),
                              width: 180,
                              transform: Matrix4.rotationZ(0.01),
                              child: Text(2 * index + 1 < _paths.length
                                  ? _paths[2 * index + 1]
                                  : ''))
                          : Text(''),
                      onTap: () {
                        _palyVideo(app_c, _paths[2 * index + 1]);
                      })
                ],
              );
            },
          )
        : Center(
            child: Text('空空如也'),
          );
  }

  _palyVideo(c, path) {
    Navigator.push(
        c, MaterialPageRoute(builder: (BuildContext _) => new PlayVideo(path: path)));
  }

  _showDialog(c, content) {
    showDialog(
        context: c,
        builder: (BuildContext _c) {
          return AlertDialog(
            title: Text(content),
          );
        });
  }

  void _addVideo(c) async {
    String _path = '';
    try {
      _path = await FilePicker.getFilePath(type: FileType.VIDEO);

      if (_path != null) {
        setState(() {
          _paths.add(_path);
        });
        // print(_paths.toString());
      }
    } on PlatformException catch (e) {
      print('Unsupported operation' + e.toString());
    }
  }
}
