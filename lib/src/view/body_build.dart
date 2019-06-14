import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chewie/chewie.dart';
// import 'package:chewie/src/chewie_player.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class BodyBuild extends StatefulWidget {
  @override
  BodyBuildState createState() => new BodyBuildState();
}

class BodyBuildState extends State<BodyBuild> {
  List<String> _paths = [];
  bool showVideo = false;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  var centerNode;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
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
    if (_chewieController != null) {
      centerNode = Chewie(
        controller: _chewieController,
      );
    } else {
      centerNode = null;
    }

    return Column(children: <Widget>[
      Expanded(
        child: Center(
          child: centerNode,
        ),
      ),
      FlatButton(
        onPressed: () {
          _chewieController.enterFullScreen();
        },
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

      setState(() {
        if (_videoPlayerController != null) {
          _videoPlayerController.dispose();
        }
        if (_chewieController != null) {
          _chewieController.dispose();
        }
        
        showVideo = true;

        _videoPlayerController = VideoPlayerController.file(new File(_path));
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          aspectRatio: 2 / 3,
          autoPlay: true,
          looping: true,
        );

        // initVideo();
      });
    } on PlatformException catch (e) {
      print('Unsupported operation' + e.toString());
    }
  }
}
