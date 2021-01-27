import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  FileSystemEntity video;

  PlayVideo({this.video,});

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {

  ChewieController _chewieController;
  VideoPlayerController controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.file(widget.video);
    _chewieController = ChewieController(
        videoPlayerController: controller,
        aspectRatio: 9/16,
        allowFullScreen: true,
        autoInitialize: true,
        looping: false,
        showControls: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text("$errorMessage"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Chewie(controller: _chewieController,),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _chewieController.dispose();
  }
}
