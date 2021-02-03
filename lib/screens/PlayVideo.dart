import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:link_download_video/screens/video_controller.dart';
import 'package:path_provider/path_provider.dart';

import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  final String video;
  double aspectRatio;
  PlayVideo({this.video, this.aspectRatio});

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {

  @override
  void initState() {
    super.initState();
    print("here is what you looking for:"+widget.video);
  }

  void dispose() {
    super.dispose();
  }

  void _onLoading(bool t,String str){
    if(t){
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context){
            return SimpleDialog(
              children: <Widget>[
                Center(
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: CircularProgressIndicator()),
                ),
              ],
            );
          }
      );
    }else{
      Navigator.pop(context);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SimpleDialog(
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Text("Great, Saved in Gallary", style: TextStyle(
                              fontSize:20,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                          Padding(padding: EdgeInsets.all(10.0),),
                          Text(str,style:TextStyle( fontSize:16.0, )),
                          Padding(padding: EdgeInsets.all(10.0),),
                          Text("FileManager > Downloaded Status",style:TextStyle( fontSize:16.0, color: Colors.teal )),
                          Padding(padding: EdgeInsets.all(10.0),),
                          MaterialButton(
                            child: Text("Close"),
                            color:Colors.teal,
                            textColor: Colors.white,
                            onPressed:  ()=> Navigator.pop(context),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    }
  }

  Future<void> shareFile() async {
    await FlutterShare.shareFile(
      title: 'Share This Video',
      text: 'This is a video',
      filePath: widget.video,
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title'
    );
  }

  Future<void> shareScreenShot() async {
    await Future.delayed(Duration(seconds: 1));

    await FlutterShare.shareFile(
      title: 'Testing video',
      filePath: widget.video,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: shareScreenShot)
        ],
        leading: IconButton(
          color: Colors.indigo,
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: ()=> Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        child: VideoController(
          aspectRatio: widget.aspectRatio,
          videoPlayerController: VideoPlayerController.file(File(widget.video)),
          looping: false,
          videoSrc: widget.video,
        ),
      ),
    );
  }
}
