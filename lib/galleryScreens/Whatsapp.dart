import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:link_download_video/directory/storage.dart';
import 'package:link_download_video/screens/PlayVideo.dart';
import 'package:link_download_video/widgets/VideoGrid.dart';
import 'package:thumbnails/thumbnails.dart';
final Directory _videoDir = new Directory('/data/user/0/com.codeminers.link_download_video/app_flutter/whatsapp/');
class Whatsapp extends StatefulWidget {
  @override
  _WhatsappState createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> {
  List<FileSystemEntity> files;
  List<Uint8List> fileThumbnail;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getThumbNails();
  }

  @override
  Widget build(BuildContext context) {
    if (!Directory("${_videoDir.path}").existsSync()) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
          title: Text("Whatsapp"),
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 60.0),
          child: Center(
            child: Text(
              "Install WhatsApp",
              style: TextStyle(
                  fontSize: 18.0
              ),),
          ),
        ),
      );
    }
    else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
          title: Text("Whatsapp"),
        ),
        body: VideoGrid(directory: _videoDir),
      );
    }
  }
}