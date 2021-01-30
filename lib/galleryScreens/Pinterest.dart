import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:link_download_video/directory/storage.dart';
import 'package:link_download_video/screens/PlayVideo.dart';
import 'package:link_download_video/widgets/VideoGrid.dart';
final Directory _videoDir = new Directory('/data/user/0/com.codeminers.link_download_video/app_flutter/pinterest/');
class Pinterest extends StatefulWidget {
  @override
  _PinterestState createState() => _PinterestState();
}

class _PinterestState extends State<Pinterest> {
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
          title: Text("Pinterest"),
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 60.0),
          child: Center(
            child: Text("Install Pinterest.", style: TextStyle(
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
          title: Text("Pinterest"),
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
