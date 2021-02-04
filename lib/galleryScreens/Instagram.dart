import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:link_download_video/directory/storage.dart';
import 'package:link_download_video/screens/PlayVideo.dart';
import 'package:link_download_video/widgets/VideoGrid.dart';
final Directory _videoDir = new Directory('/data/user/0/com.codeminers.link_download_video/app_flutter/instagram/');
class Instagram extends StatefulWidget {

  InterstitialAd interstitialAd;
  Instagram({this.interstitialAd});

  @override
  _InstagramState createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
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
          title: Text("Instgram"),
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 60.0),
          child: Center(
            child: Text("Install Instagram.", style: TextStyle(
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
          title: Text("Instagram"),
        ),
        body: VideoGrid(directory: _videoDir, interstitialAd: widget.interstitialAd, aspectRatio: 16/9,),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
