import 'dart:io';


import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  FileSystemEntity video;

  PlayVideo({this.video});

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  VideoPlayerController _controller;
  // ChewieController _chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _chewieController = ChewieController(videoPlayerController: _controller, looping: true, autoInitialize: true,);
    _controller = VideoPlayerController.file(widget.video)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Column(
          children: [
            _controller.value.initialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller,),
            )
                : Container(),
          ],
        ) ,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
