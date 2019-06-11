import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:video_player/video_player.dart';

class BodyBuild extends StatefulWidget {
  @override
  BodyBuildState createState() => new BodyBuildState();
}

class BodyBuildState extends State<BodyBuild> {
  List<String> _paths = [];
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    if (this._paths.length > 0) {
      _videoPlayerController = VideoPlayerController.asset(this._paths[0]);
      _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          aspectRatio: 3 / 2,
          autoPlay: true,
          looping: true);
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  build(BuildContext c) {
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
    return Container(child: Text('健身走起'));
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
      _showDialog(c, _path);

      if (_path != null) {
        _paths.add(_path);
        print(_paths.toString());
      }
    } on PlatformException catch (e) {
      print('Unsupported operation' + e.toString());
    }
  }
}
