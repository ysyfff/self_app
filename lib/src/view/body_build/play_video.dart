import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chewie/chewie.dart';
// import 'package:chewie/src/chewie_player.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'dart:math';

class PlayVideo extends StatefulWidget {
  final path;
  PlayVideo({this.path}) : super();
  // PlayVideo({Key: key, this.path}) : super(key: key);
  @override
  PlayVideoS createState() => new PlayVideoS(path: path);
}

class PlayVideoS extends State<PlayVideo> {
  String path;
  PlayVideoS({this.path}) : super();
  // PlayVideoS({Key key, this.path}) : super();
  // PlayVideoS({this.path}) : super();
  var centerNode;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (_videoPlayerController != null) {
        _videoPlayerController.dispose();
      }
      if (_chewieController != null) {
        _chewieController.dispose();
      }


      _videoPlayerController = VideoPlayerController.file(new File(path));
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 2 / 3,
        autoPlay: true,
        looping: true,
      );
    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    if (_chewieController != null) {
      centerNode = Chewie(
        controller: _chewieController,
      );
    } else {
      centerNode = null;
    }
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text('视频播放')),
          body: Center(
            child: centerNode,
          )),
    );
  }
}
