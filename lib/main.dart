import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:link_download_video/screens/HomeScreen.dart';
import 'package:link_download_video/screens/SplashScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MaterialApp(
  home: SplashScreen(),
  debugShowCheckedModeBanner: false,
));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final url = "https://file214.iijj.nl/?file=M3R4SUNiN3JsOHJ6WWQ3aTdPRFA4NW1rRVJIOG1kd05xL0FKakZzTUQ2NWhyNE02dytIckVOMWFLcUlCMmNHUkdkRkc0WFgrZU55R2UwU3ZuNVFyVVdlVCtKMGw4aG5HLzRNelRkdCtIVFgzbHZhbWdqaGlnQWo3TllxZFJPOXBPUzhyc3c1dXczTFZ5dmpZdkNyb3NtbWwrZ2pSU2owRnB5OGVQL0NWbzdsRnhUMk9QZEhnbHNJanRIU1M0NDVNbFBPU3VVcTdpTHd4c2M5d1RYdDdmWlZpMUpQN3l1VEptbFFObFowWjFGbWJ1dXFwRklvS0dxeVNkQWgyTnk0RSt2djlVeVFHOENNWDlHR3Q0cjBxMFdNR2ZMQncvR3VnOFAzbldXM0lMNVhKSGR5OUJLVzFsUER0NU5CZTZ4bVJ0cTNLak00R2tRMm9GZmpVQU5RUW9VWXhwTGVLNk1scmt3RG9pMXBDMGJOUWxBM3ZZUkV1V01NPQ%3D%3D";
  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;

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
                progress = value1 / value2;
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

  downloadFile() async {
    setState(() {
      loading = true;
      progress = 0;
    });
    bool downloaded = await saveVideo(
        url,
        "${DateTime.now()}.mp4");
    if (downloaded) {
      print("File Downloaded");
    } else {
      print("Problem Downloading File");
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading
            ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearProgressIndicator(
            minHeight: 10,
            value: progress,
          ),
        )
            : FlatButton.icon(
            icon: Icon(
              Icons.download_rounded,
              color: Colors.white,
            ),
            color: Colors.blue,
            onPressed: downloadFile,
            padding: const EdgeInsets.all(10),
            label: Text(
              "Download Video",
              style: TextStyle(color: Colors.white, fontSize: 25),
            )),
      ),
    );
  }
}