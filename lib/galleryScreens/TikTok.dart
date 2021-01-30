import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:link_download_video/directory/storage.dart';
import 'package:link_download_video/screens/PlayVideo.dart';
import 'package:link_download_video/widgets/VideoGrid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thumbnails/thumbnails.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
final Directory _videoDir = new Directory('/data/user/0/com.codeminers.link_download_video/app_flutter/tiktok/');
class TikTok extends StatefulWidget {
  @override
  _TikTokState createState() => _TikTokState();
}

class _TikTokState extends State<TikTok> {

  void deleteFile(String path) async {
    final file = File(path);
    await StorageModel().deleteFile(file).then((value) => print(value));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getThumbNails();
  }

  @override
  Widget build(BuildContext context) {
    if(!Directory("${_videoDir.path}").existsSync()) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
          title: Text("TikTok"),
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 60.0),
          child: Center(
            child: Text("Install TikTok.", style: TextStyle(
                fontSize: 18.0
            ),),
          ),
        ),
      );
    }
    else{
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
          title: Text("TikTok"),
        ),
        body: VideoGrid(directory: _videoDir),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

