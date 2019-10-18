import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'dart:math';

class PlayVideoPure extends StatefulWidget {
  final path;
  PlayVideoPure({this.path}) : super();
  // PlayVideo({Key: key, this.path}) : super(key: key);
  @override
  PlayVideoPureState createState() => new PlayVideoPureState(path: path);
}

class PlayVideoPureState extends State<PlayVideoPure> {
  String path;
  PlayVideoPureState({this.path}) : super();

  VideoPlayerController playerController;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    createVideo();
  }

  void createVideo() {
    playerController = VideoPlayerController.file(new File(path))
      ..addListener(listener)
      ..setVolume(0)
      ..seekTo(Duration(seconds: 1))
      ..initialize()
      ..play()
      ..pause();
  }
  

  @override
  Widget build(BuildContext c) {
    print(path);
    print('wtf');
    final aspectRatio=1 / 1;
    print(aspectRatio);
    return new AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
          child: playerController != null
              ? VideoPlayer(playerController)
              : Container()),
    );
  }
}
