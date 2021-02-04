import 'dart:io';

import 'package:flutter/material.dart';
import 'package:link_download_video/downloadingScreens/whatsappBusinessDownloader.dart';
final Directory _videoDir = new Directory('/data/user/0/com.codeminers.link_download_video/app_flutter/whatsappBusiness/');
class WhatsappBusiness extends StatefulWidget {
  @override
  _WhatsappBusinessState createState() => _WhatsappBusinessState();
}

class _WhatsappBusinessState extends State<WhatsappBusiness> {
  @override
  Widget build(BuildContext context) {
    if (!Directory("${_videoDir.path}").existsSync()) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
          title: Text("Whatsapp Business"),
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 60.0),
          child: Center(
            child: Text(
              "Install WhatsApp Business",
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
          title: Text("Whatsapp Business"),
        ),
        body: VideoGrid(directory: _videoDir),
      );
    }
  }
}
