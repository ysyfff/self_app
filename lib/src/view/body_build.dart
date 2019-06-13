import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:chewie/chewie.dart';
// import 'package:chewie/src/chewie_player.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class BodyBuild extends StatefulWidget {
  @override
  BodyBuildState createState() => new BodyBuildState();
}

class BodyBuildState extends State<BodyBuild> {
  List<String> _paths = [];
  VideoPlayerController _controller;
  // ChewieController _chewieController;
  var centerEle;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(children: <Widget>[
      Expanded(
        child: Center(
          child: _controller != null && _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
      ),
      FlatButton(
        onPressed: () {},
        child: Text('Fullscreen'),
      ),
    ]);
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
        _paths.add(_path);
        print(_paths.toString());
      }
      if(_controller!=null){
        _controller.dispose();
      }
      _controller = VideoPlayerController.file(new File(_path))
        ..initialize().then((_) {
          setState(() {
            _controller.play();
          });
        });
    } on PlatformException catch (e) {
      print('Unsupported operation' + e.toString());
    }
  }
}
