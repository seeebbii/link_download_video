import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:link_download_video/model/parseLink.dart';
import 'package:link_download_video/screens/HomeScreen.dart';
import 'package:link_download_video/screens/SplashScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class TikTokDownloader extends StatefulWidget {
  @override
  _TikTokDownloaderState createState() => _TikTokDownloaderState();
}

class _TikTokDownloaderState extends State<TikTokDownloader> {
  final Dio dio = Dio();
  final fieldController = TextEditingController();
  String finalLink;

  void getResponse() async{
    if(fieldController.text.isEmpty){
      print("Empty");
    }else{
      // var url ="https://appvideopromo.000webhostapp.com/getTikTokVideo.php?url=" + fieldController.text.toString();
      var url = fieldController.text.toString();

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get("https://appvideopromo.000webhostapp.com/exemple.php?url="+url);
      ParseLink object = ParseLink(json.decode(response.body));
      finalLink =  object.downloadUrl;
      print(finalLink);
      downloadFile("$finalLink");
    }
  }

  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = await getApplicationDocumentsDirectory();
          String newPath = directory.path+"/tiktok/";
          directory = Directory(newPath);
          // print(directory);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      File saveFile = File(directory.path + "/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
              setState(() {
                var progress = value1 / value2;
                print("$progress: Total: $value2");
              });
            });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  downloadFile(String url) async {

    bool downloaded = await saveVideo(
        url,
        "${DateTime.now()}.mp4");
    if (downloaded) {
      print("File Downloaded");
    } else {
      print("Problem Downloading File");
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: fieldController,
            decoration: InputDecoration(hintText: "Enter Link for TikTok"),
          ),
          TextButton(child: Text(
            "Download"
          ), onPressed: getResponse),

        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fieldController.dispose();
    super.dispose();
  }
}
